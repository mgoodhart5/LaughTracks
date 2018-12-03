RSpec.describe "As a user" do
  describe "When I visit /comedians" do
    it "should see unique hometowns and averages of the comedians ages, special run_times" do
      comedian_1 = Comedian.create(name: "name_1", hometown: "hometown_1", age: 1)
      Comedian.create(name: "name_2", hometown: "hometown_2", age:2)
      Comedian.create(name: "name_3", hometown: "hometown_1", age: 3)
      Comedian.create(name: "name_4", hometown: "hometown_4", age:4)

      comedian_1.specials.create(name: "special_1", run_time: "20")
      comedian_1.specials.create(name: "special_2", run_time: "30")

      visit '/comedians'

      within "div[data-spec='statistics']" do
        expect(page).to have_content("Average Age: #{Comedian.average_age.to_i}")
        expect(page).to have_content("Average Run Time: #{Special.average_run_time}")
        expect(page).to have_content("Hailing From These Cities: #{Comedian.unique_list_of_hometowns.join(', ')}")
      end
    end
  end
end
