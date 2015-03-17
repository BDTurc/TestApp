require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Type.create(title: "Phone", description: "It's a phone")
#Type.create(title: "Electronic", description: "Anything that needs electricity, unless it is a phone")
#Type.create(title: "Book", description: "It has a cover and pages with words")
#Type.create(title: "Toy", description: "Can be played with, but is not electronic")

20.times do |n|
  
  Item.create(
              title: Faker::Commerce.product_name,
              description: Faker::Lorem.paragraph,
              type_id: rand(4)+1,
              owner: Faker::Name.name)
end
