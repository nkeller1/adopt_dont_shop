
require 'rails_helper'

RSpec.describe "on the show for pet" do
  describe "as a visitor" do
    before(:each) do
      @shelter = Shelter.create(   name: "Denver Adoption",
                                  address: "1234 Colorado blvd.",
                                  city: "Denver",
                                  state: "Colorado",
                                  zip: "80230"
                               )

      @pet_1 = Pet.create(         image: "https://images.theconversation.com/files/291243/original/file-20190906-175705-cjptgw.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1000&fit=clip",
                                  name: "Lucii",
                                  approximate_age: 6000,
                                  sex: "F",
                                  shelter: @shelter
                        )
    end
    it "can update a pet" do

      visit "/pets/#{@pet_1.id}"

      expect(page).to have_link("Edit")
      
      click_link "Edit"

      expect(current_path).to eq("/pets/#{@pet_1.id}/edit")

      fill_in :image, with: "https://lh3.googleusercontent.com/proxy/iJS4ESCEIS7Cj_AiMjKXmsvKpEvWJvyAoMDLW7wLZy4IiFbKpe7Q1mWf9fgWi4hTbta_fn81YzZomW-0tyVRhNGnWMPziV8_HwrwOE9TKcQAM9Nygq4oTYkJWZdg9GondKbjhjHLuj6ojX2AHzsOrKRJfFX1WlCf6c0uZdt665oqz2uLTOK7qDJLsunNiznFXWPlpoK8fWDVRuHMfg"
      fill_in :name, with: "Abs"
      fill_in :description, with: "Cute little guy"
      fill_in :approximate_age, with: 6
      fill_in :sex, with: "male"

      click_on "Update Pet"

      expect(current_path).to eq("/pets/#{@pet_1.id}")
      expect(page).to have_content("Abs")
      expect(page).to have_content("Cute little guy")
      expect(page).to have_content("Age: 6")
      expect(page).to have_content("male")
    end
    it "has link to edit pet" do
      visit "/pets"
      expect(page).to have_link("Edit")
      click_link "Edit"
      expect(current_path).to eq("/pets/#{@pet_1.id}/edit")
    end
  end
end

