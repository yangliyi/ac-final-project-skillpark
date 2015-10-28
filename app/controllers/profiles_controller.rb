class ProfilesController < ApplicationController

  before_action :authenticate_user!, except: [:show]

  before_action :set_profile, :only => [:show, :favorite]
  before_action :set_my_profile, :only => [:edit, :update, :all_favorites]


  def show
  end

  def edit
    @skills = @profile.user.skills
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

    # TODO: refactor  current_user.toggle_favorite_profile(@profile)
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

  def all_favorites
    @all_favorites = current_user.favorite_profiles
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def set_my_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:username, :description, :photo, :location_id, category_ids: [])
  end

end
