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

    expect(page).to have_content("Edit Name")
    expect(page).to have_content("Edit Address")
    expect(page).to have_content("Edit City")
    expect(page).to have_content("Edit State")
    expect(page).to have_content("Edit Zip")
    expect(page).to have_button{"Submit"}

    fill_in 'shelter[name]', with: "Nate's Shelter"
    fill_in 'shelter[address]', with: "123 Bark Plaza"
    fill_in 'shelter[city]', with: "Aurora"
    fill_in 'shelter[state]', with: "CO"
    fill_in 'shelter[zip]', with: 80014
  end
end
