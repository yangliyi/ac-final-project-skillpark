class Skill < ActiveRecord::Base

  belongs_to :user

  has_many :skill_categoryships, dependent: :destroy
  has_many :categories, through: :skill_categoryships, dependent: :destroy

  # Liked by users
  has_many :user_skill_likeships, dependent: :destroy
  has_many :liked_users, through: :user_skill_likeships, source: :user, dependent: :destroy

  has_many :pictures, :dependent => :destroy

  validates_presence_of :name, :requirement, :description

  default_scope { order(updated_at: :desc) }

  def self.find_followed_skill_ids(category_ids)
    self.joins(:skill_categoryships).where(:skill_categoryships => {:category_id => category_ids}).pluck(:id).uniq
  end

  def like_by_user?(u)
    user_skill_likeships.select{ |x| x.user_id == u.id }.any?
  end

end
