# models-and-tests

Ruby meets the database. A model is a Ruby class for one table: each row is an object you can
read like a hash, with behavior attached. You write the rules in plain English, an AI agent in
the terminal turns them into tests and then into code, and the tests tell you both whether it
worked.

The app is a simple CRM for a sales team: companies, the people who work there, the
salespeople, and their activities. `docs/user-stories.md` has its user stories and a
wireframe.

## Getting started

1. Click **Use this template**, then **Create a new repository** in your own account. Keep it
   private.
2. In your new repository: **Code**, then **Codespaces**, then **Create codespace on main**.
   The first start takes a few minutes.
3. Start your agent in the terminal (`claude`, `codex` or `agy`) and log in. The `agent-setup`
   repo's README has the details, including what to do when the sign-in page doesn't load.

## Running things

From the top folder (where this README is):

| To | Run |
|---|---|
| Run a file | `bin/rails runner code-along/0-replay.rb` |
| Run the tests | `bin/rails test` |
| See files and data in the browser | `bin/rails server` |
| Run new migrations | `bin/rails db:migrate` |
| See every table and its rows | `bin/rails runner data.rb` |
| Start the database over | `bin/reset-db` |

`bin/reset-db` rebuilds the database from the migrations in `db/migrate/`. Every row is
deleted; your files stay as they are. Use it when the database is in a state you can't
explain, or a migration says a table already exists.

## See it in the browser

The terminal is all you need, but the browser shows two things more easily:

1. In a second terminal (the **+** on the terminal panel), run `bin/rails server`, then open
   the port it offers (or the **Ports** tab, port 3000). The server keeps that terminal busy
   until you stop it with Ctrl+C.
2. **Files** lists every Ruby file in `code-along/`, `scripts/` and `labs/`. Click one: its
   page runs it with the same command as the terminal and shows what it printed, or the
   error. Change the file, save it, and refresh the page to run it again. A new file in
   `scripts/` shows up when you refresh the list.
3. **Data** shows every table in the database and the rows in it, newest at the bottom.
   Refresh it after running a file to see what changed.

`code-along-complete/` isn't listed: copy from it into your own file to run it. A file that
waits for you to type something only runs in the terminal. A loop that never ends is stopped
after ten seconds.

## Your agent

`AGENTS.md` holds the rules every agent follows in this repo: your rules are the sentences in
`DONE.md`, and each gets a test named with it; tests first, shown failing; no
`has_many` or `belongs_to`, look related rows up with `where`; columns read hash-style,
`company["name"]`; scripts go in `scripts/`. Read it once. When your agent breaks a rule,
point it at the file.

`DONE.md` is yours: what must be true for each model, one sentence per line. Your agent reads
it and never writes to it. It will tell you every sentence has a test; open `DONE.md` beside
the test file and count.

The agent runs the tests, your files and migrations without asking. It asks before
`bin/reset-db`, since that deletes data.

## Fell behind?

`code-along-complete/` has every code-along step finished. It is for reading: open it beside
your own work and compare.

- Steps 0, 1 and 4 are single files, like the ones in `code-along/`.
- Steps 2, 3 and 5 changed files all over the app, so each is a folder that mirrors it:
  `code-along-complete/3-companies/app/models/company.rb` is the finished version of your
  `app/models/company.rb`. Each folder's README says which files to compare.

If you do copy a file by hand, never copy a migration for a table you already have: a second
one would try to create the table twice. Compare it with yours instead.

Your agent's code won't match the finished files line for line. It came from your rules, not
these. What should match: every sentence in your `DONE.md` has a test, and the tests pass.

Labs have no finished copy in the repo. Try one yourself first, alone or with a partner.

## What is where

| Path | What it is |
|---|---|
| `code-along/` | The files we work through together, in order |
| `code-along/0-replay.rb` | A game of craps replayed from a list of rolls, and a check: PASS, or an error |
| `code-along/1-classes.rb` | Classes and methods; a class of our own |
| `code-along/2-migrations.rb` | A table for companies, from a migration written by hand |
| `code-along/3-companies.rb` | Company: a script that uses it, then rules, tests and code, written by your agent |
| `code-along/4-introduce-bug.rb` | A helpful change, and the test that catches it |
| `code-along/5-contacts.rb` | Contacts at companies, found with `where` |
| `code-along-complete/` | The same steps, finished, to read and compare |
| `pbj.txt` | Instructions for a sandwich, the sandwich as data, then drawn as boxes |
| `labs/` | Practice: salespeople and their activities, then a bug of your own to catch |
| `DONE.md` | Your rules: what must be true for each model, one sentence per line |
| `test/models/` | One test file per model; your agent writes a test for each sentence in `DONE.md` |
| `scripts/` | Scripts you or your agent write; run them with `bin/rails runner scripts/<file>` |
| `docs/user-stories.md` | The CRM's user stories and a wireframe |
| `crm-schema.sql` | The CRM's four tables in SQL, for reference |
| `data.rb` | Prints every table and its rows |
| `AGENTS.md` | The rules for an AI agent working in this repo |
| `bin/reset-db` | Rebuilds the database from the migrations |
| `app/browser/`, `app/controllers/`, `app/views/` | The pages that show the files and the data |

## When something breaks

Read the error from the top. The first line says what went wrong and where; the lines under
it are where Ruby was when it happened and can usually be ignored.

- **`table "contacts" already exists`** (or any table): the database already has it. Check
  `db/migrate/` for two migrations that create the same table and remove the extra one, then
  run `bin/reset-db`.
- **`uninitialized constant Company`**: there's no model file for it yet. Check
  `app/models/company.rb`, and that the class name inside it matches.
- **`no such table: companies`**: the migration exists but hasn't run. Run `bin/rails db:migrate`.
- **`Migrations are pending`** when you run the tests: run `bin/rails db:migrate` first.
