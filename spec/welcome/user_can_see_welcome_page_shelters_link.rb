require 'rails_helper'

RSpec.describe "welcome index page", type: :feature do
  it "can see welcome and sheleters link" do

    visit "/"

    expect(page).to have_content("Adopt Don't Shop!")
    expect(page).to have_link("/shelters")
  end
end
