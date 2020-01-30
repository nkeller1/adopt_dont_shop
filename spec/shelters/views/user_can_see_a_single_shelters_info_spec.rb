require 'rails_helper'

RSpec.describe "shelter show page", type: :feature do
  it "can see the attributes of one shelter" do
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

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
    expect(page).to have_link("Edit Shelter")
    expect(page).to have_button("Delete Shelter")

    visit "/shelters/#{shelter_2.id}"

    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content(shelter_2.address)
    expect(page).to have_content(shelter_2.city)
    expect(page).to have_content(shelter_2.state)
    expect(page).to have_content(shelter_2.zip)
    expect(page).to have_link("Edit Shelter")
    expect(page).to have_button("Delete Shelter")
  end
end
