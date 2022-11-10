defmodule Popejoy.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :is_admin, :boolean, default: false
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    has_many :posts, Popejoy.Post

    timestamps()
  end

  @required_fields ~w(email)a
  @optional_fields ~w(name is_admin)a

  @doc false
  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end

  def registration_changeset(struct, params) do
    struct
    |> changeset(params)
    |> cast(params, ~w(password)a, [])
    |> validate_length(:password, min: 8, max: 100)
    |> hash_password
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true,
                      changes: %{password: password}} ->
        put_change(changeset,
                   :password_hash,
                   Bcrypt.hash_pwd_salt(password))
      _ ->
        changeset
    end
  end
end
