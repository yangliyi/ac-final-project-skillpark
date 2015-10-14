class Skill < ActiveRecord::Base

  belongs_to :user
  belongs_to :category

  has_many :pictures, :dependent => :destroy
  has_many :testpictures, :dependent => :destroy
end
