class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_profile, :set_comment, except: [:index]
  before_action :set_comment, only: [:destroy]

  def index
    @commented_profiles = current_user.comments.map {|c| c.profile }.uniq
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
