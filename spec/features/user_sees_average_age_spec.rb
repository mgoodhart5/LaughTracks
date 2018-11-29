RSpec.describe "As a user" do
  describe "When I visit /comedians" do
    it "should see an average of the comedians ages" do
      Comedian.create(name: "name_1", hometown: "hometown_1", age: 1)
      Comedian.create(name: "name_2", hometown: "hometown_2", age: 2)

      visit '/comedians'

      expect(page).to have_content(Comedian.average_age)
    end
  end
end
