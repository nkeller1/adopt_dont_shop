require 'rails_helper'

RSpec.describe "pets edit page", type: :feature do
  it "can edit an individual pet" do
    shelter_1 = Shelter.create(
                         name: "Mike's Shelter",
                         address: "1331 17th Street",
                         city: "Denver",
                         state: "CO",
                         zip: 80202
                       )

    pet_1 = Pet.create!(
                     image: "https://image.shutterstock.com/image-photo/playing-dogs-garden-260nw-1556131820.jpg",
                     name: "Fido",
                     description: "Silly",
                     age: 2,
                     sex: "Female",
                     shelter: shelter_1
                   )

    visit "/pets/#{pet_1.id}/edit"

    fill_in :image, with: "https://image.shutterstock.com/image-photo/dog-260nw-587562362.jpg"
    fill_in :name, with: "Sally"
    fill_in :description, with: "Cuddle Monster"
    fill_in :age, with: 0
    fill_in :sex, with: "Female"

    click_on 'Update Pet'

    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content('Sally')
    expect(page).to have_content('Cuddle Monster')
  end
end
