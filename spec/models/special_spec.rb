RSpec.describe Special do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        special = Special.create
        
        expect(special).to_not be_valid
      end
    end
  end
  describe 'Class Methods' do
    describe '.average_run_time' do
      it 'returns average run time for all specials' do
        Special.create(name: "special_1", run_time: "20")
        Special.create(name: "special_2", run_time: "30")

        expect(Special.average_run_time).to eq(25)
      end
    end
  end
end
