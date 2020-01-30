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

    fill_in :name, with: "Nate's Shelter"
    fill_in :address, with: "123 Bark Plaza"
    fill_in :city, with: "Aurora"
    fill_in :state, with: "CO"
    fill_in :zip, with: 80014
  end
end
