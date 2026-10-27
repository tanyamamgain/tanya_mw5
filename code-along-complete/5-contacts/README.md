# Step 5: contacts, and finding a contact's company

What this step built: the `contacts` table and `Contact` model, written by your agent from
the rules in `DONE.md`, with tests first, and a script that prints each contact with
their company's name. The files here sit at the same paths as in your app.

| Compare | With your |
|---|---|
| `db/migrate/20261017164354_create_contacts.rb` | `db/migrate/<its number>_create_contacts.rb` |
| `DONE.md` | `DONE.md` |
| `test/models/contact_test.rb` | `test/models/contact_test.rb` |
| `app/models/contact.rb` | `app/models/contact.rb` |
| `scripts/list-contacts.rb` | `scripts/list-contacts.rb` |

If you already have a migration for `contacts`, compare, don't copy: a second one would try
to create the table twice. If `bin/rails db:migrate` says the table already exists, an earlier
`contacts` table is still in the database; `bin/reset-db` rebuilds it from `db/migrate/`.

With the migration in, "Apple has three" passes before any model code: finding rows by a
column comes free. "Can't be saved without a company" fails first, and one line makes it pass:

```ruby
validates :company_id, presence: true
```

The link between the tables is one column, `company_id`. To go from a company to its contacts:

```ruby
Contact.where({ "company_id" => apple["id"] })
```

And from a contact to its company:

```ruby
Company.find_by({ "id" => contact["company_id"] })
```

That is the whole relationship: the same lookup a `WHERE` does in SQL. On the Data page, each
contact's `company_id` is the `id` of a row in `companies`.

`scripts/list-contacts.rb` prints:

```
Tim Cook (Apple)
Craig Federighi (Apple)
Lisa Jackson (Apple)
Andy Jassy (Amazon)
```
