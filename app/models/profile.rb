class Profile < ActiveRecord::Base

  belongs_to :user
  belongs_to :location

  has_many :profile_categoryships
  has_many :categories, through: :profile_categoryships

  has_many :comments, dependent: :destroy
  # Favorited by users
  has_many :user_profile_favoriteships
  has_many :favorited_users, through: :user_profile_favoriteships, source: :user

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/default/missing.jpeg"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

end
