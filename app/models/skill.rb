class Skill < ActiveRecord::Base

  belongs_to :user

  has_many :skill_categoryships
  has_many :categories, through: :skill_categoryships

  has_many :pictures, :dependent => :destroy
end
