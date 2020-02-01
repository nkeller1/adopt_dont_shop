# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Shelter.destroy_all
shelter_1 = Shelter.create(
  name: "Mike's Shelter",
  address: "1331 17th Street",
  city: "Denver",
  state: "CO",
  zip: 80202
)

shelter_2 = Shelter.create(
  name: "Meg's Shelter",
  address: "150 Main Street",
  city: "Hershey",
  state: "PA",
  zip: 17033
)
Pet.destroy_all
Pet.create!(
  image: "https://image.shutterstock.com/image-photo/playing-dogs-garden-260nw-1556131820.jpg",
  name: "Fido",
  description: "Silly",
  age: 2,
  sex: "Female",
  shelter_name: "Mike's Shelter",
  adoption_status: "open",
  shelter: shelter_1
)
Pet.create!(
  image: "https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2019/09/Dogs-portrait-3.jpg?w=750",
  name: "Nelly",
  description: "Butthead",
  age: 3,
  sex: "Male",
  shelter_name: "Mike's Shelter",
  adoption_status: "open",
  shelter: shelter_1
)

Pet.create!(
  image: "https://image.shutterstock.com/image-photo/dog-headshot-on-yellow-background-260nw-324936848.jpg",
  name: "Sammy",
  description: "Adorable",
  age: 4,
  sex: "Male",
  shelter_name: "Meg's Shelter",
  adoption_status: "pending",
  shelter: shelter_2
)
