class UserProfileFavoriteship < ActiveRecord::Base
  belongs_to :user
  belongs_to :profile, counter_cache: :favorited_users_count
end
