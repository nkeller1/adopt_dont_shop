require "rails_helper"

RSpec.describe "as a visitor" do
  describe "on show page" do 
    it "can see the that shelter and its information" do
      shelter = Shelter.create(         name: "Adopt Shop",
                                        address: "123 Fake",
                                        city: "New York City",
                                        state: "NY",
                                        zip: 90123)
      shelter_2 = Shelter.create(       name: "Some Shelter",
                                        address: "Some Address",
                                        city: "Some City",
                                        state: "Some State",
                                        zip: 00000)

      visit "/shelters/#{shelter.id}"

      expect(page).to have_content(shelter.name) 
      expect(page).to have_content(shelter.address) 
      expect(page).to have_content(shelter.city) 
      expect(page).to have_content(shelter.state)
      expect(page).to have_content(shelter.zip) 
    end
  end
end