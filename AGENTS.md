# AGENTS.md

Instructions for an AI agent working in this repo.

This is a Rails app for learning Ruby and databases. Run everything from the top folder (where
README.md is).

- Run a Ruby file with `bin/rails runner <path>`. Run the tests with `bin/rails test`. Tests
  go in `test/models/<model>_test.rb`. Scripts you are asked to write go in `scripts/`.
- The person's rules are in `DONE.md`, one sentence per line under each model's heading.
  Write one test for each sentence in `test/models/<model>_test.rb`, named with that
  sentence. Every sentence gets a test. Never edit `DONE.md`; if a sentence is unclear or
  can't be tested, say so instead.
- Red first. Write the tests, run them and show them failing, then write the code, then run
  the tests again and show them passing.
- No `has_many`, `belongs_to` or other associations. Look related rows up with `where` or
  `find_by`, for example `Contact.where({ "company_id" => company["id"] })`. A lookup used
  more than once may become a method on the model.
- Read and set columns hash-style: `company["name"]` and `company["name"] = "Apple"`, not
  `company.name`.
- Change the database's structure only with a migration: `bin/rails generate model` or
  `bin/rails generate migration`, then `bin/rails db:migrate`. Never edit `db/schema.rb`;
  Rails writes it.
- `bin/reset-db` rebuilds the database from the migrations and deletes every row. Ask before
  running it.
- Do not read, copy from or edit `code-along-complete/` unless asked. It is a reference for
  the person learning; your code comes from their pseudo-code.
- Leave `app/browser/`, `app/controllers/` and `app/views/` alone unless asked: they run the
  pages that show the files and the data.
- Explain what you changed in plain English, file by file.
