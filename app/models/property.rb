class Property < ApplicationRecord

  enum types: { Residential: 0, Office: 1, Rental: 2 }
  validates :name, :district, :city, :beds_number, :mrt_line_station, :rent_per_month, :beds_number, presence: { message: "can't be blank" }
  belongs_to :user
  has_many :favorites

end	
