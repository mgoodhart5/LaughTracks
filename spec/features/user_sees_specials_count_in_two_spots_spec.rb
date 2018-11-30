RSpec.describe "As a user" do
  describe "When I visit /comedians" do
    it "should show total specials under comedian and statistics" do
      comedian_1 = Comedian.create(name: "name_1", hometown: "hometown_1", age: 1)
      comedian_2 = Comedian.create(name: "name_2", hometown: "hometown_2", age:2)
      comedian_1.specials.create(name: "special_1", run_time: "1", image_path: "image_1")
      comedian_1.specials.create(name: "special_1", run_time: "1", image_path: "image_1")
      comedian_2.specials.create(name: "special_2", run_time: "2", image_path: "image url")

      visit '/comedians'

      within "#comedian-#{comedian_1.id}" do
        expect(page).to have_content("Total Specials: #{comedian_1.specials.count}")
      end
      within "#comedian-#{comedian_2.id}" do
        expect(page).to have_content("Total Specials: #{comedian_2.specials.count}")
      end
      within "div[data-spec='statistics']" do
        expect(page).to have_content("Total Specials: #{Special.count}")
      end
    end
  end
end
