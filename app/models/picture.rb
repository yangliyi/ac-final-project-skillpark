class Picture < ActiveRecord::Base

  belongs_to :skill

  has_attached_file :image,
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename",
    :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  default_scope { order(id: :DESC) }

end
