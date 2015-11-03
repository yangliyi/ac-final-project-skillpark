class Category < ActiveRecord::Base

  has_many :skill_categoryships, dependent: :destroy
  has_many :skills, through: :skill_categoryships, dependent: :destroy

  has_many :profile_categoryships, dependent: :destroy
  has_many :profiles, through: :profile_categoryships, dependent: :destroy

  has_attached_file :category_icon,
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/default/missing.jpg",
                    :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :s3_host_name => "s3-ap-northeast-1.amazonaws.com"

  validates_attachment_content_type :category_icon, content_type: /\Aimage\/.*\Z/

  validates_presence_of :name

end
