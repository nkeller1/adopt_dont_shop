require "rails_helper"

RSpec.describe Shelter, type: :model do 
  describe "as a visitor" do 
    it "can see the name of each shelter" do
      shelter_1 = Shelter.new(name: "Denver Shelter", 
                              address: "123 fake st.",
                              city: "Denver",
                              state: "CO",
                              zip: 80018)
      visit "/shelters"

      expect(page).to have_content(shelter_1.name)
    end
  end
end