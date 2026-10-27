# Run this file from the top folder of the repo (where README.md is):
# bin/rails runner scripts/list-companies.rb

# Start empty, so this can run more than once
Company.destroy_all

apple = Company.new
apple["name"] = "Apple"
apple["city"] = "Cupertino"
apple["state"] = "CA"
apple["url"] = "https://www.apple.com"
apple.save

amazon = Company.new
amazon["name"] = "Amazon"
amazon["city"] = "Seattle"
amazon["state"] = "WA"
amazon["url"] = "https://www.amazon.com"
amazon.save

anthropic = Company.new
anthropic["name"] = "Anthropic"
anthropic["city"] = "San Francisco"
anthropic["state"] = "CA"
anthropic["url"] = "https://www.anthropic.com"
anthropic.save

# Find one by its name and change its url
company = Company.find_by({ "name" => "Anthropic" })
company["url"] = "https://claude.ai"
company.save

for company in Company.all
  puts "#{company["name"]}, #{company["city"]}, #{company["url"]}"
end
