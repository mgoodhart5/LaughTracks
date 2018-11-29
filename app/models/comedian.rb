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

  def self.list(params)
    return Comedian.all unless params
    if params[:age]
      Comedian.where(age:params[:age])
    else
      Comedian.all
    end
  end
end
