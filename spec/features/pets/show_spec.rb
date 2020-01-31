require "rails_helper"

RSpec.describe "as a visitor", type: :feature do
  describe "on show page" do 
    before(:each) do
      @shelter_1 = Shelter.create(  name: "Denver Shelter", 
                                    address: "123 fake st.",
                                    city: "Denver",
                                    state: "CO",
                                    zip: "80018")
      @pet_1 = Pet.create(          image: "https://images.theconversation.com/files/291243/original/file-20190906-175705-cjptgw.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1000&fit=clip",
                                    name: "Lucii",
                                    approximate_age: 6000,
                                    sex: "F",
                                    shelter: @shelter_1)
                                    
      @pet_2 = Pet.create(          image: "https://www.thoughtco.com/thmb/U7DKDGmDj_zH7Sqz5JYv6JPomQs=/640x603/filters:no_upscale():max_bytes(150000):strip_icc()/dinomeme5-56a256bb3df78cf772748c40.jpg",
                                    name: "Taco",
                                    approximate_age: 300,
                                    sex: "M",
                                    shelter: @shelter_1)
    end
    
    it "can see the that pet and its information" do
      visit "/pets/#{@pet_1.id}"

      expect(page).to have_css("img[src*='#{@pet_1.image}']") 
      expect(page).to have_content(@pet_1.name) 
      expect(page).to have_content(@pet_1.approximate_age) 
      expect(page).to have_content(@pet_1.sex)
      expect(page).to have_content(@pet_1.adoptable)
    end
  end
end

