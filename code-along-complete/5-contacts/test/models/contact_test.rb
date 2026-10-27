require "test_helper"

class ContactTest < ActiveSupport::TestCase
  # One test for each sentence under Contact in DONE.md, named with that sentence.

  test "a contact can't be saved without a company" do
    contact = Contact.new
    contact["first_name"] = "Tim"
    contact["last_name"] = "Cook"
    contact.save

    assert_equal 0, Contact.all.count
  end

  test "I can find all the contacts at a company: Apple has three" do
    apple = Company.new
    apple["name"] = "Apple"
    apple.save

    amazon = Company.new
    amazon["name"] = "Amazon"
    amazon.save

    for first_name in ["Tim", "Craig", "Lisa"]
      contact = Contact.new
      contact["first_name"] = first_name
      contact["company_id"] = apple["id"]
      contact.save
    end

    contact = Contact.new
    contact["first_name"] = "Andy"
    contact["company_id"] = amazon["id"]
    contact.save

    apple_contacts = Contact.where({ "company_id" => apple["id"] })
    assert_equal 3, apple_contacts.count
  end

end
