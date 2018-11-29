RSpec.describe "As a user" do
  describe "When I visit /comedians" do
    it "should see an average of the comedians ages" do
      Comedian.create(name: "name_1", hometown: "hometown_1", age: 1)
      Comedian.create(name: "name_2", hometown: "hometown_2", age: 2)
      Special.create(name: "special_1", run_time: "20")
      Special.create(name: "special_2", run_time: "30")

      visit '/comedians'

      within "#statistics" do
        expect(page).to have_content("Statistics")
        expect(page).to have_content(Comedian.average_age)
        expect(page).to have_content(Special.average_run_time)
      end
    end
  end
end
