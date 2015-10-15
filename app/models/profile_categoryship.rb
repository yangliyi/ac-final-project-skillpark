class ProfileCategoryship < ActiveRecord::Base
  belongs_to :profile
  belongs_to :category
end
