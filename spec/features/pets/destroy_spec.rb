require 'rails_helper'
RSpec.describe 'On the show page' do
  describe 'as a visitor' do 
    before(:each) do
      @dumb = Shelter.create(       name: 'Denver Dumb Friends League',
                                    address: '1234 Colorado Blvd.',
                                    city: 'Denver',
                                    state: 'Colorado',
                                    zip: 80023
                                  )
      @pet = Pet.create(             image: "https://dachshundjournal.com/wp-content/uploads/2018/07/dachshund-1519374_1280-900x681.jpg",
                                    name: 'Twitch',
                                    approximate_age: 5,
                                    sex: 'Male',
                                    description: 'Small Black and Brown doxin',
                                    adoptable: 'yes',
                                    shelter: @dumb
                                  )
      @pet_1 = Pet.create(          image: "https://images.theconversation.com/files/291243/original/file-20190906-175705-cjptgw.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1000&fit=clip",
                                    name: "Lucii",
                                    approximate_age: 6000,
                                    sex: "F",
                                    shelter: @dumb
                                    )
    end
      it 'can delete a pet' do

      visit "/pets/#{@pet.id}"

      click_link 'Delete Pet'

      expect(current_path).to eq('/pets')
      expect(page).to_not have_content(@pet.image)
      expect(page).to_not have_content(@pet.name)
      expect(page).to_not have_content(@pet.approximate_age)
      expect(page).to_not have_content(@pet.sex)
      expect(page).to_not have_content(@pet.description)
    end
    it "sees a link to delete info" do 
      visit "/pets"

      within("#pet-#{@pet.id}") do
        click_link "Delete"
      end
        expect(current_path).to eq("/pets")
        expect(page).to_not have_content(@pet.name)
    end
  end
end