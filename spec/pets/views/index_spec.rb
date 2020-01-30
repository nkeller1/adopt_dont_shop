require 'rails_helper'

RSpec.describe "pet index page", type: :feature do
  it "can see all pets" do
    pet_1 = Pet.create(
      image: "https://image.shutterstock.com/image-photo/playing-dogs-garden-260nw-1556131820.jpg",
      name: "Fido",
      age: 2,
      sex: "Female",
      shelter_name: "Mike's Shelter"
    )

    pet_2 = Pet.create(
      image: "https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2019/09/Dogs-portrait-3.jpg?w=750",
      name: "Nelly",
      age: 3,
      sex: "Male",
      shelter_name: "Meg's Shelter"
    )

    visit '/pets'

    expect(page).to have_css("img[src*='#{pet_1.image}']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.shelter_name)
  end
end
