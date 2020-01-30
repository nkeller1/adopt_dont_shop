# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Shelter.destroy_all
Shelter.create(
             name: "Mike's Shelter",
             address: "1331 17th Street",
             city: "Denver",
             state: "CO",
             zip: 80202
           )
Shelter.create(
            name: "Meg's Shelter",
            address: "150 Main Street",
            city: "Hershey",
            state: "PA",
            zip: 17033
          )
