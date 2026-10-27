# Nothing to run in this file. The steps happen in the terminal and in the files they
# make.

# Lab 1: two more tables, by hand
# The CRM has companies and contacts. The sales team needs two more things: the
# salespeople themselves, and the activities they log with contacts (a call, a meeting,
# a note). crm-schema.sql has all four tables in SQL; use it as your reference.
#
# Write these two migrations yourself, no agent, the way you wrote the one for
# companies. Do Salesperson first, then repeat the steps for Activity.

# 1. In the terminal, make the model and its migration:
#    bin/rails generate model ______

# 2. Open the two new files: the model in app/models/ and the migration in db/migrate/.
#    What table name did Rails choose for Salesperson?

# 3. In the migration, add one line per column from crm-schema.sql. Leave out id: every
#    table gets one without asking. A column that holds another table's id is an
#    integer:
#    t.integer "______"

# 4. In the terminal, run the migration:
#    bin/rails db:migrate

# 5. Open db/schema.rb and check that the new table matches crm-schema.sql.
