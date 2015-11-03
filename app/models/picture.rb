class Picture < ActiveRecord::Base

  belongs_to :skill, touch: true

  has_attached_file :image,
    :path => ":rails_root/public/images/:id/:style/:filename",
    :url  => "/images/:id/:style/:filename",
    :styles => { :large => "600x600>", :medium => "400x400>", :thumb => "100x100>" },
    :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :s3_host_name => "s3-ap-northeast-1.amazonaws.com"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  default_scope { order(id: :DESC) }

end
