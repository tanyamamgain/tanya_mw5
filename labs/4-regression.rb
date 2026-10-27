# Nothing to run in this file. The steps happen in the terminal and in
# app/models/activity.rb. Needs lab 3 first.

# Lab 4: would your tests catch it?
# Someone logging activities in a hurry keeps leaving the salesperson blank, and the
# save fails. A developer decides to help: when the salesperson is missing, use the
# first salesperson in the table.

# 1. Run the tests. Everything should pass before you change anything.
#    bin/rails test

# 2. Before you paste anything: is this a bug? Which of your sentences in DONE.md says
#    so, if any? Write down whether you expect a test to fail.

# 3. Open app/models/activity.rb. Paste these lines inside the class, just under its
#    first line, and save:
#
#    before_validation :fill_in_missing_salesperson
#
#    def fill_in_missing_salesperson
#      if self["salesperson_id"].blank?
#        first_salesperson = Salesperson.all[0]
#        if first_salesperson != nil
#          self["salesperson_id"] = first_salesperson["id"]
#        end
#      end
#    end

# 4. Run the tests again.
#    bin/rails test
#    Did a test fail? Did it match what you expected in step 2?

# 5. If nothing failed, your tests never said "an activity can't be saved without a
#    salesperson" in a way this change breaks. Add a sentence under Activity in DONE.md
#    that would catch it, and ask your agent for its test. Run it with the lines still in:
#    it should fail. If it passes, it isn't testing the rule yet. (Hint: the change
#    only does something when there is a salesperson in the table to fill in.)

# 6. Take the lines back out of app/models/activity.rb. Run the tests: all pass.

# Reflection
# A test suite is only as good as the rules behind it. A rule nobody wrote down
# isn't protected, by you or by your agent.
