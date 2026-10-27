# Step 2: a table for companies

What this step built: the `companies` table, from one migration written by hand, and an empty
`Company` model. The files here sit at the same paths as in your app. Compare them with
yours; don't copy them in.

| Compare | With your |
|---|---|
| `db/migrate/20261017164353_create_companies.rb` | `db/migrate/<your number>_create_companies.rb` |
| `app/models/company.rb` | `app/models/company.rb` |
| `db/schema.rb` | `db/schema.rb` |

The steps, filled in:

1. `bin/rails generate model Company`
2. Open `app/models/company.rb` and the new file in `db/migrate/`.
3. Inside the `create_table` block, add:

   ```ruby
   t.string "name"
   t.string "city"
   t.string "state"
   t.string "url"
   ```

4. `bin/rails db:migrate`
5. Open `db/schema.rb`.

Your migration's number is the date and time you generated it, so it won't match this one.
That's fine. If you already have a migration for `companies`, compare, don't copy: a second
one would try to create the table twice.

`db/schema.rb` lists the columns in alphabetical order, with `created_at` and `updated_at`
mixed in. Rails writes it that way; the order doesn't matter.

Missed a column after you ran the migration? Add it to the migration, then run
`bin/reset-db`. It rebuilds the database from `db/migrate/` and deletes every row; your files
stay as they are.
