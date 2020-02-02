require "rails_helper"

  RSpec.describe "on the index page", type: :feature do 
    describe "as a visitor" do
      before(:each) do
        @shelter_1 = Shelter.create(name: "Denver Shelter", 
                                    address: "123 fake st.",
                                    city: "Denver",
                                    state: "CO",
                                    zip: "80018")
  
        @shelter_2 = Shelter.create(name: "Aurora Shelter",
                                    address: "800 Some Ave",
                                    city: "Aurora",
                                    state: "CO",
                                    zip: "80249")
      end
      it "can see the name of each shelter" do
        visit "/shelters"

        expect(page).to have_content(@shelter_1.name)
        expect(page).to have_content(@shelter_2.name)
      end
      it "has links to shelters" do
        visit "/shelters"

        expect(page).to have_link(@shelter_1.name)

        click_link(@shelter_1.name)
        
        expect(current_path).to eq("/shelters/#{@shelter_1.id}")

        visit "/shelters"

        expect(page).to have_link(@shelter_2.name)

        click_link(@shelter_2.name)
        
        expect(current_path).to eq("/shelters/#{@shelter_2.id}")
     end
  end
end
