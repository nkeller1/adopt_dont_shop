require 'rails_helper'

RSpec.describe "pets show page", type: :feature do
  it "can see the attributes for one pet" do
    shelter_2 = Shelter.create!(
      name: "Meg's Shelter",
      address: "150 Main Street",
      city: "Hershey",
      state: "PA",
      zip: 17033
    )
    pet_3 = Pet.create(
      image: "https://image.shutterstock.com/image-photo/dog-headshot-on-yellow-background-260nw-324936848.jpg",
      name: "Sammy",
      description: "Adorable",
      age: 4,
      sex: "Male",
      shelter_name: "Meg's Shelter",
      shelter: shelter_2
    )

    visit "/pets/#{pet_3.id}"

    expect(page).to have_css("img[src*='#{pet_3.image}']")
    expect(page).to have_content(pet_3.name)
    expect(page).to have_content(pet_3.description)
    expect(page).to have_content(pet_3.age)
    expect(page).to have_content(pet_3.sex)
    expect(page).to have_content(pet_3.adoption_status)
  end
end
