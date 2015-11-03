class Profile < ActiveRecord::Base

  belongs_to :user
  belongs_to :location

  has_many :profile_categoryships, dependent: :destroy
  has_many :categories, through: :profile_categoryships, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :publiccomments, dependent: :destroy
  # Favorited by users
  has_many :user_profile_favoriteships, dependent: :destroy
  has_many :favorited_users, through: :user_profile_favoriteships, source: :user, dependent: :destroy

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/default/missing.jpg",
                    :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :s3_host_name => "s3-ap-northeast-1.amazonaws.com"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

end
