class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  before_action :check_admin

  layout "admin"
  # GET /admin/categories
  # GET /admin/categories.json
  def index
    @categories = Category.all
  end

  # GET /admin/categories/1
  # GET /admin/categories/1.json
  def show
  end

  # GET /admin/categories/new
  def new
    @category = Category.new
  end

  # GET /admin/categories/1/edit
  def edit
  end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category .save
        format.html { redirect_to admin_categories_url, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/categories/1
  # PATCH/PUT /admin/categories/1.json
  def update
    if params[:destroy_category_icon] == "1"
      @category.category_icon = nil
    end
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_categories_url, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/categories/1
  # DELETE /admin/categories/1.json
  def destroy
    if @category.skills.count == 0
      @category.destroy
      respond_to do |format|
        format.html { redirect_to admin_categories_url, notice: 'Category was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash[:alert] = "有文章的分類不能刪除！"
      redirect_to admin_categories_url
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name, :category_icon)
  end
end
