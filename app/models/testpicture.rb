class Testpicture < ActiveRecord::Base

  belongs_to :skill

  has_attached_file :image,
    styles: { medium: "300x300>", thumb: "100x100>" },
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"

  do_not_validate_attachment_file_type :image
end
