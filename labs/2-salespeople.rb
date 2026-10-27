# Nothing to run in this file. You write the rules in plain English; your agent writes the
# Ruby. Needs lab 1 first.

# Lab 2: salespeople, from plain English to tests to code

# 1. Open DONE.md. Under Salesperson, write the rules, one sentence per line. What can't
#    be allowed? (Two salespeople with the same email? A salesperson with no name?)

# 2. Give your agent a prompt that points it at your rules under Salesperson in DONE.md
#    and asks for a test for each one, failing first. Write the prompt yourself;
#    code-along/3-companies.rb has one to start from.

# 3. Check its work before the model: DONE.md beside test/models/salesperson_test.rb.
#    Every sentence has a test with its name? Each test checks what its sentence says?
#    Then ask for the code that makes them pass, and run them yourself:
#    bin/rails test

# 4. A script. Ask your agent for scripts/salespeople.rb: it deletes every salesperson
#    first, creates two, then prints how many there are and each one's full name. It
#    should print something like:
#
#    Salespeople: 2
#    Ben Block
#    Brian Eng

# CHALLENGE:
# 5. Change one salesperson's email in the script, after it's saved. Before you run it:
#    what should the output show? Then run it and check.
