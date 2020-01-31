
require 'rails_helper'

RSpec.describe "creating a new pet" do
  it "can create a pet" do
    shelter = Shelter.create!(name: "Denver Adoption",
                              address: "1234 Colorado blvd.",
                              city: "Denver",
                              state: "Colorado",
                              zip: "80230"
                            )

    @pet_1 = Pet.create(          image: "https://images.theconversation.com/files/291243/original/file-20190906-175705-cjptgw.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1000&fit=clip",
                                    name: "Lucii",
                                    approximate_age: 6000,
                                    sex: "F",
                                    shelter: shelter)

    visit "/shelters/#{shelter.id}/pets"

    expect(page).to have_link("Create Pet")
    
    click_link "Create Pet"

    expect(current_path).to eq("/shelters/#{shelter.id}/pets/new")

    fill_in :image, with: "https://dachshundjournal.com/wp-content/uploads/2018/07/dachshund-1519374_1280-900x681.jpg"
    fill_in :name, with: "Weiner"
    fill_in :approximate_age, with: 5
    find('#sex').find(:xpath, 'option[2]').select_option


    click_on "Add New Pet"

    new_pet = Pet.last

    expect(current_path).to eq("/shelters/#{shelter.id}/pets")
    expect(page).to have_css("img[src*='#{new_pet.image}']")
    expect(page).to have_content(new_pet.name)
    expect(page).to have_content(new_pet.approximate_age)
    expect(page).to have_content(new_pet.sex)
  end
end
