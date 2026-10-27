# Run this file from the top folder of the repo (where README.md is):
# bin/rails runner code-along/4-introduce-bug.rb
# Or, with bin/rails server running, click it on the Files page in the browser.

# A helpful change
# Imports from a spreadsheet keep failing on rows with no company name. A developer
# decides to help: when the name is blank, fill one in, so the row always saves.
# Is that a bug? Your tests decide.

# 1. Run this file. It tries to save a company with a city and no name:
#    bin/rails runner code-along/4-introduce-bug.rb

# 2. Run the tests. Everything should pass before you change anything.
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

# 4. Run this file again. What changed?

# 5. Run the tests again.
#    bin/rails test
#    Did any fail? Which one, and why?

# 6. Take the lines back out of app/models/company.rb, save, and run the tests once
#    more. Everything should pass again.

company = Company.new
company["city"] = "Chicago"

if company.save
  puts "Saved, with the name \"#{company["name"]}\""
  # Take it back out, so the next run starts the same way
  company.destroy
else
  puts "Not saved: #{company.errors.full_messages.join(", ")}"
end
