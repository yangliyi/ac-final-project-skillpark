class Comment < ActiveRecord::Base

  belongs_to :profile
  belongs_to :user # author

  default_scope { order(id: :DESC) }

  def self.get_communications(user)
    comments = includes(:profile, :user => :profile).where( "profile_id = ? or user_id = ?", user.profile, user )

    comments.group_by do |c|
      ( c.user == user )? c.profile : c.user.profile
    end
  end

end
