RSpec.describe "As a user" do
  describe "When I visit /comedians?age=36" do
    it "should see the list of comedians that match age criteria" do
      comedian_1 = Comedian.create(name: "name_1", hometown: "city_1", age: 36)
      comedian_2 = Comedian.create(name: "name_2", hometown: "city_2", age: 53)
      comedian_3 = Comedian.create(name: "name_3", hometown: "city_1", age: 40)
      comedian_4 = Comedian.create(name: "name_4", hometown: "city_4", age: 36)

      visit '/comedians?age=36'

      expect(page).to_not have_css("#comedian-#{comedian_2.id}")
      expect(page).to_not have_css("#comedian-#{comedian_3.id}")
      expect(page).to have_css("#comedian-#{comedian_1.id}")
      expect(page).to have_css("#comedian-#{comedian_4.id}")
    end
  end
end
