class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :photos

  validates :satellite_type, presence: true
  validates :data_type, presence: true
  validates :data_size, presence: true
  validates :acquisition_years, presence: true
end
