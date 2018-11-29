RSpec.describe "As a user" do
  describe "When I visit /comedians" do
    it "should see a thumbnail next to each of the comedians' specials" do
      comedian_1 = Comedian.create(name: "name_1", hometown: "hometown_1", age: 1)
      comedian_2 = Comedian.create(name: "name_2", hometown: "hometown_2", age:2)
      image_1 = "https://m.media-amazon.com/images/M/MV5BMTQ2MzU4NzEyM15BMl5BanBnXkFtZTgwMjI3Njg0ODE@._V1_SY1000_CR0,0,666,1000_AL_.jpg"
      image_2 = "https://m.media-amazon.com/images/M/MV5BODIyNDE5NDg2OV5BMl5BanBnXkFtZTcwMDc0NDU5Ng@@._V1_UY317_CR13,0,214,317_AL_.jpg"
      comedian_1.specials.create(name: "special_1", run_time: "1", image_path: image_1)
      comedian_2.specials.create(name: "special_2", run_time: "2", image_path: image_2)

      visit '/comedians'

      within "#comedian-" + "#{comedian_1.id}" do
        expect(page).to have_css("img[src*='#{image_1}']")
      end

      within "#comedian-" + "#{comedian_2.id}" do
        expect(page).to have_css("img[src*='#{image_2}']")
      end
    end
  end
end
