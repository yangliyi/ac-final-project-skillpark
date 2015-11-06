class CommentsController < ApplicationController

  def index
    @comments_group_by_profile = Comment.get_communications(current_user)

    @profiles = @comments_group_by_profile.keys

    if params[:id]
      @profile = Profile.find(params[:id])
      respond_to do |format|
          format.html
          format.js
        end
    end
  end

  def create
    @profile = Profile.find(params[:profile_id])

    if current_user
      @comment = @profile.comments.create(comment_params)
      @comment.user = current_user

      if @comment.save
        @profile.save

        @comments_group_by_profile = Comment.get_communications(current_user)

        @profiles = @comments_group_by_profile.keys

        if params[:id]
          @profile = Profile.find(params[:id])
        end
        respond_to do |format|
          format.html {
            redirect_to profile_comments_path(current_user.profile, id: @profile)
          }
          format.js
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
