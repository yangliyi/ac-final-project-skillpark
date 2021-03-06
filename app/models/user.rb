class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  before_create :generate_authentication_token

  serialize :fb_raw_data

  has_one :profile, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :publiccomments, dependent: :destroy

  # Favorite profiles of user
  has_many :user_profile_favoriteships, dependent: :destroy
  has_many :favorite_profiles, through: :user_profile_favoriteships, source: :profile, dependent: :destroy

  # Liked skills of user
  has_many :user_skill_likeships, dependent: :destroy
  has_many :like_skills, through: :user_skill_likeships, source: :skill, dependent: :destroy

  def self.get_fb_data(access_token)
    res = RestClient.get "https://graph.facebook.com/v2.4/me",  { :params => { :access_token => access_token } }

    if res.code == 200
      JSON.parse( res.to_str )
    else
      Rails.logger.warn(res.body)
      nil
    end
  end

  def generate_authentication_token
    self.authentication_token = Devise.friendly_token
  end

  def favorite_profile?(profile)
    self.favorite_profiles.include?(profile)
  end

  def toggle_favorite_profile(profile)
    if self.favorite_profile?(profile)
      self.favorite_profiles.delete(profile)
    else
      self.favorite_profiles << profile
    end
  end

  def toggle_like(skill)
    if self.like_skill?(skill)
      self.like_skills.delete(skill)
    else
      self.like_skills << skill
    end
  end

  def like_skill?(skill)
    self.like_skills.include?(skill)
  end

  def admin?
    self.role == "admin"
  end

  def profile_username
    self.profile.username
  end

  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    user = User.find_by_fb_uid( auth.uid )
    if user
      user.fb_token = auth.credentials.token
      user.fb_raw_data = auth
      user.save!
      return user
    end

    # Case 2: Find existing user by email
    existing_user = User.find_by_email( auth.info.email )
    if existing_user
      existing_user.fb_uid = auth.uid
      existing_user.fb_token = auth.credentials.token
      existing_user.fb_raw_data = auth
      existing_user.save!
      return existing_user
    end

    # Case 3: Create new password
    user = User.new
    user.fb_uid = auth.uid
    user.fb_token = auth.credentials.token
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.fb_raw_data = auth
    user.save!
    profile = user.create_profile
    profile.username = auth.info.name
    profile.fb_image = auth.info.image + "?width=600"
    profile.save!
    return user
  end

end
