# Nothing to run in this file. Your agent writes the Ruby; you decide what it should do and
# read what it wrote.

# Contacts: people who work at companies
# A contact works at one company. The contacts table holds the company's id, the same
# way a foreign key did in SQL, and you look a contact's company up with where.

# 1. Open DONE.md. Under Contact, write the rules, one sentence per line. Can a contact
#    exist without a company? How will you find the people who work at Apple? For example:
#
#    A contact can't be saved without a company.
#    I can find all the contacts at a company: Apple has three.

# 2. Give your agent this prompt:
#
#    My rules for Contact are under Contact in DONE.md. Add a Contact model and its
#    migration (first name, last name, email and company id), then write a test for each
#    rule, run them and show me they fail, then make them pass.

# 3. Read the migration. Then DONE.md beside test/models/contact_test.rb: every sentence
#    has a test with its name, and each test checks what it says? Then read the model and
#    run the tests yourself:
#    bin/rails test

# 4. A script. Give your agent this prompt:
#
#    Write scripts/list-contacts.rb. It deletes every contact and every company first,
#    then creates Apple and Amazon, three contacts at Apple and one at Amazon, and
#    prints each contact's full name with their company's name, like "Tim Cook (Apple)".
#    Run it.
#
#    How did it find each contact's company? It should be a where (or find_by), not
#    contact.company. Check AGENTS.md if not.
#
#    Then look at Data in the browser: each contact's company_id is the id of a row in
#    companies.
