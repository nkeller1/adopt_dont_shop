require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all the shelters avaiable" do
    shelter_1 = Shelter.create(name: "Mike's Shelter",
                         address:      "1331 17th Street Denver, CO 80202")
    shelter_2 = Shelter.create(name:       "Meg's Shelter",
                              address:      "150 Main Street Hershey, PA 17033")

    visit "/shelters"

    expect(page).to have_content(shelter.name)
    expect(page).to have_content(shelter.address)
    expect(page).to have_content(shelter.name)
    expect(page).to have_content(shelter.address)
  end
end
