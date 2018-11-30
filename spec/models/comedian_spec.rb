RSpec.describe Comedian do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comic = Comedian.create(age: 48)
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg')
        expect(comic).to_not be_valid
      end
    end
  end

  describe 'Class Methods' do
    describe '.average_age' do
      it 'returns average age for all comedians' do
        Comedian.create(name: "name_1", hometown: "hometown_1", age: 1)
        Comedian.create(name: "name_2", hometown: "hometown_2", age:2)

        expect(Comedian.average_age).to eq(1.5)
      end
    end
  end


  describe 'Class Methods' do
    describe '.unique_list_of_hometowns' do
      it 'returns only a list of non-repeated cities' do
        city_1 = "hometown_1"
        city_2 = "hometown_2"
        city_4 = "hometown_4"
        Comedian.create(name: "name_1", hometown: city_1, age: 1)
        Comedian.create(name: "name_2", hometown: city_2, age: 2)
        Comedian.create(name: "name_3", hometown: city_1, age: 3)
        Comedian.create(name: "name_4", hometown: city_4, age: 4)

        expect(Comedian.unique_list_of_hometowns).to eq([city_1, city_4, city_2])
      end
    end
  end
end
