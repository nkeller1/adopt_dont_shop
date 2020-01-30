require "rails_helper"

  RSpec.describe "on the welcome page", type: :feature do 
    describe "as a visitor" do
      it "sees welcome message" do
        visit "/"
        expect(page).to have_content("Exotic Dinosaur Adoption")
      end
      it "see discription of homepage" do
        visit "/"

        expect(page).to have_content("The place for luxury pets.")
      end
      it "has button that goes to shelters" do
        visit "/"

        expect(page).to have_button("Shelters")

        click_button "Shelters"

        expect(current_path).to eq("/shelters")
      end
    end
  end