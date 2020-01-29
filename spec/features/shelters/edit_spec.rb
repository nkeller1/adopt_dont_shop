require "rails_helper"

  RSpec.describe "on the index page", type: :feature do 
    describe "as a visitor" do
      before(:each) do
        @shelter_1 = Shelter.create(name: "Denver Shelter", 
                                    address: "123 fake st.",
                                    city: "Denver",
                                    state: "CO",
                                    zip: 80018)
  
        @shelter_2 = Shelter.create(name: "Aurora Shelter",
                                    address: "800 Some Ave",
                                    city: "Aurora",
                                    state: "CO",
                                    zip: 80249)
      end
      it "can edit a shelter" do
      
      visit "/shelters/#{@shelter_1.id}"

      expect(page).to have_link("Edit")

      click_link "Edit"

      expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")

      name = "Dino shelter"
      address = "2123 lake st."
      city = "Richmond"
      state = "VA"
      zip = "23143"

      fill_in "Name", with: name
      fill_in "Address", with: address
      fill_in "City", with: city
      fill_in "State", with: state
      fill_in "Zip", with: zip

      click_button "Update Shelter"

      expect(current_path).to eq("/shelters")

      new_shelter = Shelter.last

      expect(page).to have_content(new_shelter.name)
      expect
    end
  end
end

