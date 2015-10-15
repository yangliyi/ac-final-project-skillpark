class Category < ActiveRecord::Base

  has_many :skill_categoryships
  has_many :skills, through: :skill_categoryships

  has_many :profile_categoryships
  has_many :profiles, through: :profile_categoryships

end
