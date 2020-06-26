# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: crownstake@example.com, password: "121212")
Product.create([{name:"new", description: "text", price: "102", make:2012}, {name:"new second", description: "asd", price: "210", make:2012}])