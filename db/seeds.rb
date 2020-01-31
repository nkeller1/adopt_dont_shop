# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pet.destroy_all
Shelter.destroy_all

@Mike = Shelter.create(       name: "Mike's Shelter",
                              address: "1331 17th Street",
                              city: "Denver",
                              state: "CO",
                              zip: "80202")

@Meg = Shelter.create(        name: "Meg's Shelter",
                              address: "150 Main Street",
                              city: "Hershey",
                              state: "PA",
                              zip: "17033")

@dino = Shelter.create(  name: "Dino Shelter", 
                              address: "123 Fossil St.",
                              city: "Denver",
                              state: "CO",
                              zip: "80018")

@pet_1 = Pet.create(          image: "https://images.theconversation.com/files/291243/original/file-20190906-175705-cjptgw.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1000&fit=clip",
                              name: "Lucii",
                              approximate_age: 6000,
                              sex: "F",
                              shelter: @dino)
                                    
@pet_2 = Pet.create(          image: "https://www.thoughtco.com/thmb/U7DKDGmDj_zH7Sqz5JYv6JPomQs=/640x603/filters:no_upscale():max_bytes(150000):strip_icc()/dinomeme5-56a256bb3df78cf772748c40.jpg",
                              name: "Taco",
                              approximate_age: 300,
                              sex: "M",
                              shelter: @dino)

