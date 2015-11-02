class CommentsController < ApplicationController

  def index
    @comments_group_by_profile = Comment.order("id DESC").get_communications(current_user)

    @profiles = @comments_group_by_profile.keys
  end

  def create
    @profile = Profile.find(params[:profile_id])

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

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

end
