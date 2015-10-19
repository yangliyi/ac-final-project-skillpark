class ProfilesController < ApplicationController

  before_action :authenticate_user!
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

  # Add and remove favorite profiles
  # for current_user
  def favorite
    @profile = Profile.find(params[:id])

    if current_user.favorite_profile?(@profile)
      current_user.favorite_profiles.delete(@profile)
    else
      current_user.favorite_profiles << @profile
    end
    respond_to do |format|
      format.html {
        redirect_to :back
      }
      format.js
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
