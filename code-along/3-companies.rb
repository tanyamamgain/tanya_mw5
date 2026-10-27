# Nothing to run in this file.

# Company: use it, then decide what can't be allowed
# From here on you don't type the Ruby. You say what you need, your agent writes it, and
# you read what it wrote.


# Part 1: use it

# 1. Start your agent in the terminal (claude, codex or agy) and give it this prompt:
#
#    Write scripts/list-companies.rb. It deletes every company first, so it can run more
#    than once. Then it creates three companies, each with a name, city, state and url,
#    finds one of them by its name and changes its url, and prints every company's name,
#    city and url, one per line. Run it.

# 2. Read scripts/list-companies.rb. Is every column read like company["name"]?

# 3. See it in the browser. If the server isn't running, start it in a second terminal
#    (the + on the terminal panel) with bin/rails server, then open port 3000 from the
#    Ports tab.
#    - Files, then scripts/list-companies.rb: it runs and shows what it printed.
#    - Data: the companies table, and the three rows the script saved.

# 4. Find the SQL. Open log/development.log in the editor and scroll to the bottom.
#    ActiveRecord wrote the SQL for you and logged it. Find:
#    - an INSERT INTO "companies" for each company
#    - the SELECT ... WHERE "companies"."name" = ... that found one by its name
#    - the UPDATE that changed its url

# Notice what you didn't write: a single line of code in app/models/company.rb. The
# migration gave you all of this: saving, finding, changing. There's nothing to test yet.


# Part 2: what can't be allowed

# 5. Open DONE.md. Under Company, write the rules, one sentence per line. Plain English,
#    no Ruby. What can't be allowed? For example:
#
#    A company can't be saved without a name.
#    Two companies can't have the same name.

# 6. Give your agent this prompt:
#
#    My rules for Company are under Company in DONE.md. Write a test for each one, run
#    them and show me they fail. Don't change the model yet.

# 7. Check its work. Open DONE.md and test/models/company_test.rb side by side (drag one
#    tab to the right edge of the editor). Count: does every sentence have a test with its
#    name? Read each test: does it check what its sentence says? Your agent will tell you
#    it's done. This is how you know.

# 8. Then:
#
#    Make them pass.

# 9. Read app/models/company.rb. Then run the tests yourself:
#    bin/rails test
