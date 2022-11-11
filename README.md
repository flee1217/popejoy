# Popejoy

Seating up to 1985 patrons, Popejoy Hall is the largest such venue in New Mexixo. Following a major renovation in 1996 and seating replacement in summer 2007, Popejoy hosts touring Broadway shows, symphony concerts, musical soloists and artists of international caliber, world-renowned ballet and modern dance companies, and noted speakers from a broad spectrum of disciplines.

This project seeks to implement a backend system for ticket purchases at Popejoy.

Current goals

- [ ] create user accounts schema and authentication
  - [x] create user accounts table
    - [x] define initial users schema
  - [ ] implement some user authentication
    - [x] set up user registration (html view, create action)
    - [ ] implement sessions management
  - [ ] sessions can persist for authenticated users
    - [ ] use `guardian` for token-based sessions management
  - [ ] figure out how to handle admin users

# To run

This repo contains a docker-compose.yml containing
* Elixir 1.13
* Phoenix 1.6
