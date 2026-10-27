# Nothing to run in this file. The steps happen in the terminal and in the files they
# make; follow them here.

# A table for companies, by hand
# A company has a name, city, state and url. In SQL that would be a CREATE TABLE in a
# schema file you rebuild the database from. In Rails it is a migration: one versioned
# step that changes the database, kept in db/migrate/ and run in order.

# 1. In the terminal, make the model and its migration. The model's name is singular and
#    capitalized; the table Rails makes for it is plural and lowercase.
#    bin/rails generate model ______

# 2. Open the two new files:
#    app/models/______.rb             the model, empty for now
#    db/migrate/<number>_create_______.rb   the migration

# 3. In the migration, inside the create_table block, add one line per column:
#    t.string "______"

# 4. In the terminal, run the migration:
#    bin/rails db:migrate

# 5. Open db/schema.rb. Rails wrote it from the migration, so never edit it by hand.
#    Compare it with the CREATE TABLE you would have written in SQL.
