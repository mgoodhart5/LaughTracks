class Comedian < ActiveRecord::Base
  has_many :specials
  validates :name, presence: true
  validates :age, presence: true

  def self.average_age
    average(:age)
  end

  def self.unique_list_of_hometowns
    distinct.pluck(:hometown)
  end

end
