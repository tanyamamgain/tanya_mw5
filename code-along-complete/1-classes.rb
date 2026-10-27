# Run this file from the top folder of the repo (where README.md is):
# bin/rails runner code-along-complete/1-classes.rb

# Classes: giving behavior to things
# Every value in Ruby has a class, the kind of thing it is. The class decides what the
# value can do. What it can do are its methods, called with a dot: thing.method

# 1. What kind of thing is it? A string and a number, and their classes.
food = "tacos"
total = 7
puts food.class  # String
puts total.class # Integer

# 2. What can it do? Methods every string has, and one every number has.
puts food.upcase # TACOS
puts food.length # 5
puts total.odd?  # true

# 3. Our own class: a Dog is a Hash (so it can hold a name) that can also speak.
class Dog < Hash
  def speak
    "woof"
  end
end

# 4. A dog of our own: make one, give it a name, ask its class, make it speak.
#    Dog.new is a method called on the class itself. It makes a new dog.
jenkins = Dog.new
jenkins["name"] = "Jenkins"
puts jenkins.class   # Dog
puts jenkins["name"] # Jenkins
puts jenkins.speak   # woof

# 5. Why this matters: a model is a class for one database table.
#    Company is a class. Company.new makes one row, and company["name"] reads a column
#    the way jenkins["name"] reads a key. Company.all and Company.where are methods
#    called on the class, and they ask the table for rows that already exist.
