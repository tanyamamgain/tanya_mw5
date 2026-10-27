# Run this file from the top folder of the repo (where README.md is):
# bin/rails runner code-along-complete/4-introduce-bug.rb

# A helpful change
# Imports from a spreadsheet keep failing on rows with no company name. A developer
# decides to help: when the name is blank, fill one in, so the row always saves.
# Is that a bug? Your tests decide.

# 1. Run this file. It tries to save a company with a city and no name:
#    bin/rails runner code-along/4-introduce-bug.rb
#
#    Not saved: Name can't be blank

# 2. Run the tests. Everything passes before you change anything.
#    bin/rails test

# 3. Open app/models/company.rb. Paste these lines inside the class, just under its
#    first line, and save:
#
#    before_validation :fill_in_missing_name
#
#    def fill_in_missing_name
#      if self["name"].blank?
#        self["name"] = "Unknown company"
#      end
#    end
#
#    before_validation runs the method every time a company is about to be checked
#    and saved.

# 4. Run this file again:
#
#    Saved, with the name "Unknown company"
#
#    The import "works" now.

# 5. Run the tests again.
#    bin/rails test
#
#    One fails:
#
#    Failure:
#    CompanyTest#test_a_company_can't_be_saved_without_a_name
#    Expected: 0
#      Actual: 1
#
#    Why: a company with no name is filled in as "Unknown company" before the check
#    for a name runs, so the check passes and the row is saved. The rule "a company
#    can't be saved without a name" is broken, and the test that says so is the one
#    that failed. Nothing else noticed. The app still runs.

# 6. Take the lines back out of app/models/company.rb, save, and run the tests once
#    more. Everything passes again, and this file prints "Not saved" again.

# What it shows: tests protect you from the next person's helpful change, and the next
# person is often an agent. If no test had failed in step 5, the rule was never written
# down as a test. Add it as a comment in test/models/company_test.rb and have your agent
# write the test under it.

company = Company.new
company["city"] = "Chicago"

if company.save
  puts "Saved, with the name \"#{company["name"]}\""
  # Take it back out, so the next run starts the same way
  company.destroy
else
  puts "Not saved: #{company.errors.full_messages.join(", ")}"
end
