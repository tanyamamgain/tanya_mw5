# Nothing to run in this file. You write the rules in plain English; your agent writes the
# Ruby. Needs labs 1 and 2 first, and the contacts from the code-along.

# Lab 3: activities, and finding related rows with where
# An activity is one thing a salesperson did with one contact: "met at Cupertino". It
# holds two ids, the salesperson's and the contact's.

# 1. Under Activity in DONE.md, write the rules for an activity, one sentence per line.
#    Can an activity exist without a salesperson? Without a contact? How will you find one
#    salesperson's activities?

# 2. Your prompt to your agent: a test for each sentence, failing first. Check every
#    sentence got its test, then ask for the code, and run them yourself:
#    bin/rails test

# 3. A script. Ask your agent for scripts/activities.rb: it deletes every
#    activity first, then creates three activities for one salesperson with two
#    different contacts, then prints the activities between that salesperson and one
#    contact, like this:
#
#    Activities between Ben and Tim Cook:
#    - quick checkin over facetime
#    - met at Cupertino
#
#    Read how it found them. Every lookup should be a where or a find_by on an id
#    column. If you see has_many or belongs_to, point your agent at AGENTS.md.

# CHALLENGE:
# 4. All of one salesperson's activities, across every contact:
#
#    Ben's Activities:
#    Tim Cook - quick checkin over facetime
#    Tim Cook - met at Cupertino
#    Andy Jassy - met at Amazon HQ
#
# 4a. Add each contact's company:
#
#    Ben's Activities:
#    Tim Cook (Apple) - quick checkin over facetime
#    Tim Cook (Apple) - met at Cupertino
#    Andy Jassy (Amazon) - met at Amazon HQ
#
#    How many lookups does each line need? Follow the ids: activity to contact to company.

# CHALLENGE:
# 5. How many activities does each salesperson have?
#
#    Ben Block: 3 activities
#    Brian Eng: 0 activities
