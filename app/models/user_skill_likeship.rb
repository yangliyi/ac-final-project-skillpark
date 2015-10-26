class UserSkillLikeship < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill, counter_cache: :liked_users_count
end
