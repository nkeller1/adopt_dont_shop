require 'rails_helper'

RSpec.describe "shelter_pets edit page", type: :feature do
  it "can edit an individual pet that belongs to a shelter" do
    shelter_1 = Shelter.create(
                         name: "Mike's Shelter",
                         address: "1331 17th Street",
                         city: "Denver",
                         state: "CO",
                         zip: 80202
                       )
                       
    visit "/shelters/#{shelter_1.id}/edit"

    fill_in :image, with: "https://image.shutterstock.com/image-photo/dog-260nw-587562362.jpg"
    fill_in :name, with: "Sally"
    fill_in :description, with: "Cuddle Monster"
    fill_in :age, with: 0
    fill_in :sex, with: "Female"

    click_on 'Update Pet'

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content('Sally')
    expect(page).to have_content('Cuddle Monster')
  end
end
