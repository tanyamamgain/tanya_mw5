# Run this file from the top folder of the repo (where README.md is):
# bin/rails runner scripts/list-contacts.rb

# Start empty, so this can run more than once
Contact.destroy_all
Company.destroy_all

apple = Company.new
apple["name"] = "Apple"
apple["city"] = "Cupertino"
apple["state"] = "CA"
apple.save

amazon = Company.new
amazon["name"] = "Amazon"
amazon["city"] = "Seattle"
amazon["state"] = "WA"
amazon.save

contact = Contact.new
contact["first_name"] = "Tim"
contact["last_name"] = "Cook"
contact["email"] = "tim@apple.com"
contact["company_id"] = apple["id"]
contact.save

contact = Contact.new
contact["first_name"] = "Craig"
contact["last_name"] = "Federighi"
contact["email"] = "craig@apple.com"
contact["company_id"] = apple["id"]
contact.save

contact = Contact.new
contact["first_name"] = "Lisa"
contact["last_name"] = "Jackson"
contact["email"] = "lisa@apple.com"
contact["company_id"] = apple["id"]
contact.save

contact = Contact.new
contact["first_name"] = "Andy"
contact["last_name"] = "Jassy"
contact["email"] = "andy@amazon.com"
contact["company_id"] = amazon["id"]
contact.save

# Each contact holds its company's id. Look the company up by that id.
for contact in Contact.all
  company = Company.find_by({ "id" => contact["company_id"] })
  puts "#{contact["first_name"]} #{contact["last_name"]} (#{company["name"]})"
end
