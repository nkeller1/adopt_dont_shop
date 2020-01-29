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
      visit "/shelters/#{@shelter_1.id}"

      expect(page).to have_link("Delete Shelter")

      click_on "Delete Shelter"

      expect(current_path).to eq("/shelters")
      expect(page).to_not have_content(@shelter_1.name)  
  end
end
