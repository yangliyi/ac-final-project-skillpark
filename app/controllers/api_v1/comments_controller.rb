class ApiV1::CommentsController < ApiController

  before_action :authenticate_user_from_token!, :except => [:index]

  def index
    @comments = Comment.all
  end

  def create
    @profile = Profile.find_by_username(params[:data][0][:commented_user] )

    @comment = @profile.comments.create(comment_params)
    @comment.profile = @profile
    @comment.user = User.find_by_authentication_token( params[:auth_token] )

    if @comment.save
      render :json => { :message => "OK", :id => @comment.id }
    else
      render :json => { :message => "Validate failed" }, :status => 400
    end

  end

  def comment_params
    params.permit(:content)
  end

end
