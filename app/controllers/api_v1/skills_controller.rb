class ApiV1::SkillsController < ApiController
  def index
    @skills = Skill.all
  end
end
