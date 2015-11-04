class ApiV1::ProfilesController < ApiController


  def index
    @profiles = Profile.all
  end

  def favorite

    @user = User.find_by_authentication_token( params[:auth_token] )
    @profile = Profile.find(params[:id])

    if @user && @profile
      if @user.favorite_profile?(@profile)
        @user.favorite_profiles.delete(@profile)
        render :json => { :message => "Successfully removed from favorites", :id => @profile.id }
      else
        current_user.favorite_profiles << @profile
        render :json => { :message => "Successfully added to favorites", :id => @profile.id }
      end
    else
      render :json => { :message => "Validate failed" }, :status => 400
    end

  end

end
