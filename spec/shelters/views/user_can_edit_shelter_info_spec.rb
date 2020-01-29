require 'rails_helper'

RSpec.describe "shelters edit page", type: :feature do
  it "can edit an individual shelter" do
    shelter_1 = Shelter.create(
                         name: "Mike's Shelter",
                         address: "1331 17th Street",
                         city: "Denver",
                         state: "CO",
                         zip: 80202
                       )
    visit "/shelters/#{shelter_1.id}/edit"

    expect(page).to have_content("Shelter Name")
    expect(page).to have_content("Address")
    expect(page).to have_content("City")
    expect(page).to have_content("State")
    expect(page).to have_content("Zip")
    expect(page).to have_button{"Submit"}
  end
end
