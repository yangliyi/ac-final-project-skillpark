class PubliccommentsController < ApplicationController

  before_action :set_profile

  def create
    if current_user
      @publiccomment = @profile.publiccomments.create(publiccomment_params)
      @publiccomment.user = current_user
      if @publiccomment.save
        respond_to do |format|
          format.html {
            redirect_to profile_path(@profile)
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

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  def publiccomment_params
    params.require(:publiccomment).permit(:content, :user_id)
  end

end
