class CommentsController < ApplicationController

  before_action :set_profile, :set_comment, except: [:index]
  before_action :set_comment, only: [:destroy]

  def index
    @comments_group_by_profile = Comment.get_communications(current_user)

    @profiles = @comments_group_by_profile.keys
  end

  def create
    if current_user
      @comment = @profile.comments.create(comment_params)
      @comment.user = current_user

      if @comment.save
        if @profile.save
          redirect_to profile_comments_path(current_user.profile)
        end
      end
    else
      flash[:alert] = "要登入才可以留言！"
      redirect_to :back
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
