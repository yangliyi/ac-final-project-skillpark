class ProfilesController < ApplicationController

  before_action :set_profile, :only => [:show, :edit, :update]

  def show
  end


  def edit
  end

  def update

      if @profile.update(profile_params)
      flash[:notice] = "個人資料修改成功！"
      redirect_to profile_path(@profile)
    else
      render 'edit'
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:username, :description, :photo, :location_id, category_ids: [])
  end

end
