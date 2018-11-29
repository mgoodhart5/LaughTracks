class Special < ActiveRecord::Base
  belongs_to :comedian
  validates :name, presence: true

  def self.average_run_time
    average(:run_time)
  end
end
