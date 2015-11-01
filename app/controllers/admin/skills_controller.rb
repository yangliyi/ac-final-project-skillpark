class Admin::SkillsController < ApplicationController
  before_action :set_admin_skill, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  before_action :check_admin

  layout "admin"
  # GET /admin/skills
  # GET /admin/skills.json
  def index
    @admin_skills = Admin::Skill.all
  end

  # GET /admin/skills/1
  # GET /admin/skills/1.json
  def show
  end

  # GET /admin/skills/new
  def new
    @admin_skill = Admin::Skill.new
  end

  # GET /admin/skills/1/edit
  def edit
  end

  # POST /admin/skills
  # POST /admin/skills.json
  def create
    @admin_skill = Admin::Skill.new(admin_skill_params)

    respond_to do |format|
      if @admin_skill.save
        format.html { redirect_to @admin_skill, notice: 'Skill was successfully created.' }
        format.json { render :show, status: :created, location: @admin_skill }
      else
        format.html { render :new }
        format.json { render json: @admin_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/skills/1
  # PATCH/PUT /admin/skills/1.json
  def update
    if params[:destroy_image] == "1"
      @admin_skill.pictures.delete_all
    end

    respond_to do |format|
      if @admin_skill.update(admin_skill_params)
        format.html { redirect_to @admin_skill, notice: 'Skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_skill }
      else
        format.html { render :edit }
        format.json { render json: @admin_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/skills/1
  # DELETE /admin/skills/1.json
  def destroy
    @admin_skill.destroy
    respond_to do |format|
      format.html { redirect_to admin_skills_url, notice: 'Skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def about
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_skill
    @admin_skill = Admin::Skill.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_skill_params
    params.require(:admin_skill).permit(:name, :requirement, :description, :pictures, category_ids: [])
  end
end
