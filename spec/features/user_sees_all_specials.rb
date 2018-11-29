RSpec.describe "As a user" do
  describe "When I visit /comedians" do
    it "should see a list of comedians' specials" do
      comedian_1 = Comedian.create(name: "name_1", hometown: "hometown_1", age: 1)
      comedian_2 = Comedian.create(name: "name_2", hometown: "hometown_2", age:2)
      comedian_1.specials.create(name: "special_1", run_time: "1")
      comedian_2.specials.create(name: "special_2", run_time: "2")


      visit '/comedians'

      expect(page).to have_content(comedian_1.specials.first.name)
      expect(page).to have_content(comedian_1.specials.first.run_time)
      expect(page).to have_content(comedian_2.specials.first.name)
      expect(page).to have_content(comedian_2.specials.first.run_time)
    end
  end
end
