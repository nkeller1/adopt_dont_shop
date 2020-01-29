require 'rails_helper'

RSpec.describe "shelter create new page", type: :feature do
  it "can can create a new shelter" do
    shelter_1 = Shelter.create(
                         name: "Mike's Shelter",
                         address: "1331 17th Street",
                         city: "Denver",
                         state: "CO",
                         zip: 80202
                       )

    visit "/shelters/new"

    expect(page).to have_content("Add a New Shelter")
    expect(page).to have_content("Shelter Name")
    expect(page).to have_content("Address")
    expect(page).to have_content("City")
    expect(page).to have_content("State")
    expect(page).to have_content("Zip")
    expect(page).to have_button("Submit")
  end
end
