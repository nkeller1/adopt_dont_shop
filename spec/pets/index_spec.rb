require 'rails_helper'

RSpec.describe "pet index page", type: :feature do
  it "can see all pets" do
    shelter_1 = Shelter.create!(
      name: "Mike's Shelter",
      address: "1331 17th Street",
      city: "Denver",
      state: "CO",
      zip: 80202
    )

    pet_1 = Pet.create(
      image: "https://image.shutterstock.com/image-photo/playing-dogs-garden-260nw-1556131820.jpg",
      name: "Fido",
      description: "Silly",
      age: 2,
      sex: "Female",
      shelter: shelter_1
    )
    pet_2 = Pet.create(
      image: "https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2019/09/Dogs-portrait-3.jpg?w=750",
      name: "Nelly",
      description: "butthead",
      age: 3,
      sex: "Male",
      shelter: shelter_1
    )

    visit '/pets'

    expect(page).to have_css("img[src*='#{pet_1.image}']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_link("Update Pet")
    expect(page).to have_button("Delete Pet")
  end
end
