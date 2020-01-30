require "rails_helper"

  RSpec.describe "on the index page", type: :feature do 
    describe "as a visitor" do
      it "can create new shelter" do

      visit "/shelters"

      expect(page).to have_link("New Shelter")

      click_link "New Shelter"

      expect(current_path).to eq("/shelters/new")

      name = "Dogo shelter"
      address = "2123 lake st."
      city = "Richmond"
      state = "VA"
      zip = "23143"

      fill_in "Name", with: name
      fill_in "Address", with: address
      fill_in "City", with: city
      fill_in "State", with: state
      fill_in "Zip", with: zip

      click_button "Create Shelter"

      expect(current_path).to eq("/shelters")

      new_shelter = Shelter.last

      expect(page).to have_content("Dogo shelter")
    end
  end
end
