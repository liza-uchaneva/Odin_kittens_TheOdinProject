# Odin Kittens

A small RESTful Rails app for managing kittens, which also serves its data as a JSON API. Part of the [The Odin Project](https://www.theodinproject.com/) Rails curriculum.

## Features

- Full CRUD for kittens (name, age, cuteness, softness) with validations
- Flash messages for successful and failed actions
- The same controller actions respond with **HTML or JSON** (`/kittens.json`, `/kittens/1.json`) via `respond_to`

## Tech stack

Ruby on Rails 7.1 · SQLite · Hotwire · Importmap

## Running locally

Requires Ruby 3.2.2.

```bash
bundle install
bin/rails db:setup
bin/rails server
```

Then open http://localhost:3000.

Try the API: `curl http://localhost:3000/kittens.json`
