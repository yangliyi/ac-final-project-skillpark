class Admin::ProfilesController < ApplicationController
  before_action :set_admin_profile, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  before_action :check_admin

  layout "admin"
  # GET /admin/profiles
  # GET /admin/profiles.json
  def index
    @admin_profiles = Admin::Profile.all
  end

  # GET /admin/profiles/1
  # GET /admin/profiles/1.json
  def show
  end

  # GET /admin/profiles/new
  def new
    @admin_profile = Admin::Profile.new
  end

  # GET /admin/profiles/1/edit
  def edit
  end

  # POST /admin/profiles
  # POST /admin/profiles.json
  def create
    @admin_profile = Admin::Profile.new(admin_profile_params)

    respond_to do |format|
      if @admin_profile.save
        format.html { redirect_to @admin_profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @admin_profile }
      else
        format.html { render :new }
        format.json { render json: @admin_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/profiles/1
  # PATCH/PUT /admin/profiles/1.json
  def update
    respond_to do |format|
      if @admin_profile.update(admin_profile_params)
        format.html { redirect_to @admin_profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_profile }
      else
        format.html { render :edit }
        format.json { render json: @admin_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/profiles/1
  # DELETE /admin/profiles/1.json
  def destroy
    @admin_profile.destroy
    respond_to do |format|
      format.html { redirect_to admin_profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def check_admin
    unless current_user.admin?
      raise ActiveRecord::RecordNotFound
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_profile
    @admin_profile = Admin::Profile.find(params[:id])
    @profile = Profile.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_profile_params
    params.require(:admin_profile).permit(:username, :description, :photo, :location_id, category_ids: [])
  end
end
