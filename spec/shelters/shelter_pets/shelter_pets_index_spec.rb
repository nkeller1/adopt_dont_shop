require 'rails_helper'

RSpec.describe 'shelter pets index page', type: :feature do
  it 'can show all pets the shelter currently has avaiable' do
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

    pet_1 = Pet.create(
      image: "https://image.shutterstock.com/image-photo/playing-dogs-garden-260nw-1556131820.jpg",
      name: "Fido",
      description: "Silly",
      age: 2,
      sex: "Female",
      shelter_name: "Mike's Shelter",
      shelter: shelter_1
    )
    pet_2 = Pet.create(
      image: "https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2019/09/Dogs-portrait-3.jpg?w=750",
      name: "Nelly",
      description: "butthead",
      age: 3,
      sex: "Male",
      shelter_name: "Mike's Shelter",
      shelter: shelter_1
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

    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_content(pet_1.shelter_name)

    expect(page).to_not have_content(pet_3.image)
    expect(page).to_not have_content(pet_3.name)

    expect(page).to have_css("img[src*='#{pet_1.image}']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)

    expect(page).to have_css("img[src*='#{pet_2.image}']")
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_2.description)
    expect(page).to have_content(pet_2.age)
    expect(page).to have_content(pet_2.sex)
  end
end
