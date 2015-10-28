class Admin::PicturesController < ApplicationController
  before_action :set_admin_picture, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  before_action :check_admin

  layout "admin"
  # GET /admin/pictures
  # GET /admin/pictures.json
  def index
    @admin_pictures = Admin::Picture.all
  end

  # GET /admin/pictures/1
  # GET /admin/pictures/1.json
  def show
  end

  # GET /admin/pictures/new
  def new
    @admin_picture = Admin::Picture.new
  end

  # GET /admin/pictures/1/edit
  def edit
  end

  # POST /admin/pictures
  # POST /admin/pictures.json
  def create
    @admin_picture = Admin::Picture.new(admin_picture_params)

    respond_to do |format|
      if @admin_picture.save
        format.html { redirect_to @admin_picture, notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @admin_picture }
      else
        format.html { render :new }
        format.json { render json: @admin_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/pictures/1
  # PATCH/PUT /admin/pictures/1.json
  def update
    respond_to do |format|
      if @admin_picture.update(admin_picture_params)
        format.html { redirect_to @admin_picture, notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_picture }
      else
        format.html { render :edit }
        format.json { render json: @admin_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/pictures/1
  # DELETE /admin/pictures/1.json
  def destroy
    @admin_picture.destroy
    respond_to do |format|
      format.html { redirect_to admin_pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_picture
    @admin_picture = Admin::Picture.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_picture_params
    params[:admin_picture]
  end
end
