class SkillsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :set_skill, :only => [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @skill = Skill.new
  end

  def show
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.user = current_user
    if @skill.save
      if params[:images]
        params[:images].each { |image|
          @skill.pictures.create(image: image)
        }
      end
      flash[:notice] = "技能新增成功！"
      redirect_to skill_path(@skill)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:destroy_image] == "1"
      @skill.pictures.delete_all
    end

    if @skill.update(skill_params)
      if params[:images]
        params[:images].each { |image|
          @skill.pictures.create(image: image)
        }
      end
      flash[:notice] = "技能更新成功！"
      redirect_to skill_path(@skill)
    else
      render 'edit'
    end

  end

  def destroy
    if @skill.destroy
      flash[:notice] = "技能刪除成功！"

      redirect_to :back
    end
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name, :requirement, :description, :pictures, :category_id)
  end

end
