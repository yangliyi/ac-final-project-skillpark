class SkillsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :set_skill, :only => [:show, :edit, :update, :destroy, :like]
  before_action :set_interested_skills, :only => [:index]
  def index
    @q = Skill.ransack(params[:q])

    if current_user && params[:q]
      @skills = @q.result.includes(:categories).uniq
    elsif current_user && current_user.profile.try(:categories)
      category_ids = current_user.profile.categories.map {|c| c.id }
      @skills = Skill.joins(:skill_categoryships).where(:skill_categoryships => {:category_id => category_ids}).uniq
    else
      @skills = Skill.all
    end

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

  # Add and remove like skills
  # for current_user
  def like
    if current_user.like_skill?(@skill)
      current_user.like_skills.delete(@skill)
    else
      current_user.like_skills << @skill
    end
    respond_to do |format|
      format.html {
        redirect_to :back
      }
      format.js
    end
  end

  private

  def set_interested_skills
    if current_user && current_user.profile.try(:categories)
      @categories = current_user.profile.categories
        a = []
        @categories.each do |c|
          c.skills.each do |s|
            a << s
          end
        end
        @skills = a.uniq
    else
      @skills = Skill.all
    end
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name, :requirement, :description, :pictures, category_ids: [])
  end

end
