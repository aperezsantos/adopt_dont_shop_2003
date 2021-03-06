# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Shelter.destroy_all
Pet.destroy_all

shelter_1 = Shelter.create(name: "Cat Care Society", address: "5787 W 6th Ave", city: "Lakewood", state: "CO", zip: "80214")
shelter_2 = Shelter.create(name: "Foothils Animal Shelter", address: "580 McIntyre St", city: "Golden", state: "CO", zip: "80401")

bishi = shelter_1.pets.create(image: "https://ih.constantcontact.com/fs159/1104169690227/img/112.jpg?a=1118551010932", name: "Bishi", age: "10", sex: "M", description: "Reserved, but with a mischivous flare about him, he always let's you know what is on his mind.", adoption_status: "Adoptable")
simba = shelter_1.pets.create(image: "https://images.pexels.com/photos/736532/pexels-photo-736532.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=3&amp;h=750&amp;w=1260", name: "Simba", age: "2", sex: "M", description: "His love of life and curiosity are so contagious, you'll find yourself wanting to explore the world by his side.", adoption_status: "Pending")
starla = shelter_2.pets.create(image: "https://images.pexels.com/photos/1605481/pexels-photo-1605481.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260", name: "Starla", age: "18", sex: "F", description: "At times demanding, somewhat sassy, but all times a Queen, she will steal your heart", adoption_status: "Pending")
jasper = shelter_2.pets.create(image: "https://images.pexels.com/photos/1543793/pexels-photo-1543793.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260", name: "Jasper", age: "11", sex: "M", description: "Calm, cool, and collected, he enjoys boxes and drinking from the sink", adoption_status: "Adoptable")
