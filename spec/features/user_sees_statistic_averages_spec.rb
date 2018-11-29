RSpec.describe "As a user" do
  describe "When I visit /comedians" do
    it "should see unique hometowns and averages of the comedians ages, special run_times" do
      Comedian.create(name: "name_1", hometown: "hometown_1", age: 1)
      Comedian.create(name: "name_2", hometown: "hometown_2", age:2)
      Comedian.create(name: "name_3", hometown: "hometown_1", age: 3)
      Comedian.create(name: "name_4", hometown: "hometown_4", age:4)

      Special.create(name: "special_1", run_time: "20")
      Special.create(name: "special_2", run_time: "30")

      visit '/comedians'

      within "#statistics" do
        expect(page).to have_content("Statistics")
        expect(page).to have_content("Average Age:")
        expect(page).to have_content(Comedian.average_age)
        expect(page).to have_content("Average Run Time:")
        expect(page).to have_content(Special.average_run_time)
        expect(page).to have_content("Hailing From These Cities:")
        expect(page).to have_content("#{Comedian.unique_list_of_hometowns.join(', ')}")
      end
    end
  end
end
