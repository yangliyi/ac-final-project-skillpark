class Publiccomment < ActiveRecord::Base

  belongs_to :profile
  belongs_to :user

  default_scope { order(id: :desc) }

end
