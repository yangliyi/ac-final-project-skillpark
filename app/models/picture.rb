class Picture < ActiveRecord::Base

  belongs_to :skill

  has_attached_file :image,
    styles: { medium: "300x300>", thumb: "100x100>" },
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
