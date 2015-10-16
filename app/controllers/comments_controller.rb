class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_profile, :set_comment, except: [:index]
  before_action :set_comment, only: [:destroy]

  def index
    @comments = Comment.where( "profile_id = ? or user_id = ?", current_user.profile, current_user ).order("id DESC")
    a = []
    @comments.each do |c|
      a << c.profile
      a << c.user.profile
    end
    @profiles = a.uniq
  end

  def create
    @comment = @profile.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      if @profile.save
        redirect_to profile_comments_path(current_user.profile)
      end
    end
  end


  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

end
