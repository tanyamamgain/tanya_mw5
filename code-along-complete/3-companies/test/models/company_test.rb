require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  # One test for each sentence under Company in DONE.md, named with that sentence.

  test "a company can't be saved without a name" do
    company = Company.new
    company["city"] = "Beaverton"
    company["state"] = "OR"
    company.save

    assert_equal 0, Company.all.count
  end

  test "two companies can't have the same name" do
    company1 = Company.new
    company1["name"] = "Nike"
    company1.save

    company2 = Company.new
    company2["name"] = "Nike"
    company2.save

    assert_equal 1, Company.all.count
  end

end
