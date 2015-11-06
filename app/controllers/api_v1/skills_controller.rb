class ApiV1::SkillsController < ApiController

  before_action :authenticate_user_from_token!, :except => [:index]
  before_action :set_user, :except => [:index]

  def index
    @skills = Skill.all
  end

  def create
    @skill = @user.skills.new(skill_params)

    if @skill.save
      if params[:images]
        params[:images].each { |image|
          @skill.pictures.create(image: image)
        }
      end
      render :json => { :message => "Successfully created", :id => @skill.id }
    else
      render :json => { :message => "Validate failed" }, :status => 400
    end
  end

  def skill_params
    params.permit(:name, :requirement, :description, :pictures, category_ids: [])
  end

  def set_user
    @user = User.find_by_authentication_token( params[:auth_token] )
  end

end
