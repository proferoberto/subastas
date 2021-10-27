# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = []
10.times do 
    users << User.create(name: Faker::Name.unique.name, 
                          lastname: Faker::Name.last_name, 
                          age: rand(18..60), 
                          email: Faker::Internet.email(domain: 'edutecno.com'),
                          about: Faker::Lorem.paragraph)
end

