class SkillsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_my_skill, :only => [:edit, :update, :destroy, :like]

  def index
    @q = Skill.ransack(params[:q])

    if params[:q]
      @skills = @q.result.includes(:categories).uniq
    else
      @skills = Skill.includes(:pictures, :user => { :profile => :location } ).all

      if current_user && current_user.profile.try(:categories)
        @skills = @skills.includes(:user_skill_likeships)

        category_ids = current_user.profile.category_ids
        recommended_skill_ids = Skill.joins(:skill_categoryships).where(:skill_categoryships => {:category_id => category_ids}).pluck(:id).uniq

        @unfollowed_skills = @skills.select{ |x| !recommended_skill_ids.include?(x.id) }
        @skills = @skills.select{ |x| recommended_skill_ids.include?(x.id) }
      end
    end

  end

  def new
    @skill = Skill.new
  end

  def show
    @skill = Skill.includes(:pictures).find(params[:id])
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

    # Refactor: current_user.toggle_like(@skill)
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

  def set_my_skill
    @skill = current_user.skills.includes(:pictures).find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name, :requirement, :description, :pictures, category_ids: [])
  end

end
