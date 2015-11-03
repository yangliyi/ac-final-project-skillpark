class Publiccomment < ActiveRecord::Base

  belongs_to :profile
  belongs_to :user

  validates_presence_of :content

end
