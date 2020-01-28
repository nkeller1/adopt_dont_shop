require "rails_helper"

RSpec.describe Shelter, type: :model do 
  describe "as a visitor" do 
    it "can see the name of each shelter" do
      shelter_1 = Shelter.new(name: "Denver Shelter", 
                              address: "123 fake st.",
                              city: "Denver",
                              state: "CO",
                              zip: 80018)

      shelter_2 = Shelter.new(name: "Aurora Shelter",
                              address: "800 Some Ave",
                              city: "Aurora",
                              state: "CO",
                              zip: 80249)
      visit "/shelters"

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_2.name)
    end
  end
end