RSpec.describe "As a user" do
  describe "When I visit /comedians/new" do
    it "should see a form to input a new comedian into the database" do

      visit '/comedians/new'

      comedian_name = "Ruby"
      hometown = "Montrose, CO"
      fill_in 'comedian[name]', with: comedian_name
      fill_in 'comedian[hometown]', with: hometown
      fill_in 'comedian[age]', with: 32

      click_button 'Submit'

      expect(current_path).to eq('/comedians')
      expect(page).to have_content(comedian_name)
      expect(page).to have_content(hometown)
    end
  end
end
