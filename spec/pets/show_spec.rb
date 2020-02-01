require 'rails_helper'

RSpec.describe "pets show page", type: :feature do
  it "can see the attributes one one pet" do
    shelter_2 = Shelter.create!(
      name: "Meg's Shelter",
      address: "150 Main Street",
      city: "Hershey",
      state: "PA",
      zip: 17033
    )
    pet_1 = Pet.create!(
      image: "https://image.shutterstock.com/image-photo/dog-headshot-on-yellow-background-260nw-324936848.jpg",
      name: "Sammy",
      age: 4,
      sex: "Male",
      shelter_name: "Meg's Shelter",
      shelter: shelter_2
    )

    visit "/pets/#{pet.id}"

    expect(page).to have_content(pet_1.image)
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.aboptable)
  end
end
