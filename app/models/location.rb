class Location < ActiveRecord::Base
  has_many :profiles

  validates_presence_of :city

end
