class ApiV1::ProfilesController < ApiController
  def index
    @profiles = Profile.all
  end
end
