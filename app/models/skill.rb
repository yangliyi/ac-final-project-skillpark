class Skill < ActiveRecord::Base

  # TODO: Add more validations

  belongs_to :user

  has_many :skill_categoryships, dependent: :destroy
  has_many :categories, through: :skill_categoryships, dependent: :destroy

  # Liked by users
  has_many :user_skill_likeships, dependent: :destroy
  has_many :liked_users, through: :user_skill_likeships, source: :user, dependent: :destroy

  has_many :pictures, :dependent => :destroy

  default_scope { order(updated_at: :desc) }

  def like_by_user?(u)
    user_skill_likeships.select{ |x| x.user_id == u.id }.any?
  end

end
