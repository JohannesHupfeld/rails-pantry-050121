# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.create([{ name: 'Sugar' }, { name: 'Salt' }, { name: 'Flour' }, { name: 'Cinnamon' }, { name: 'Pasta' }])

User.create([{username: "user1"}, {username: "user2"}, {username: "user3"}])

Measurement.create([{item_id: 1, quantity: 1, unit: "Cup"}, {item_id: 2, quantity: 1, unit: "Container"},{item_id: 3, quantity: 3, unit: "Bags"},{item_id: 4, quantity: 2, unit: "Containers"},{item_id: 5, quantity: 1, unit: "Box"},{item_id: 5, quantity: 3, unit: "Boxes"}])