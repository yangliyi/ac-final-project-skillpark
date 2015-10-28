class Admin::LocationsController < ApplicationController
  before_action :set_admin_location, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  before_action :check_admin

  layout "admin"
  # GET /admin/locations
  # GET /admin/locations.json
  def index
    @admin_locations = Admin::Location.all
  end

  # GET /admin/locations/1
  # GET /admin/locations/1.json
  def show
  end

  # GET /admin/locations/new
  def new
    @admin_location = Admin::Location.new
  end

  # GET /admin/locations/1/edit
  def edit
  end

  # POST /admin/locations
  # POST /admin/locations.json
  def create
    @admin_location = Admin::Location.new(admin_location_params)

    respond_to do |format|
      if @admin_location.save
        format.html { redirect_to @admin_location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @admin_location }
      else
        format.html { render :new }
        format.json { render json: @admin_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/locations/1
  # PATCH/PUT /admin/locations/1.json
  def update
    respond_to do |format|
      if @admin_location.update(admin_location_params)
        format.html { redirect_to @admin_location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_location }
      else
        format.html { render :edit }
        format.json { render json: @admin_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/locations/1
  # DELETE /admin/locations/1.json
  def destroy
    @admin_location.destroy
    respond_to do |format|
      format.html { redirect_to admin_locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_location
    @admin_location = Admin::Location.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_location_params
    params.require(:admin_location).permit(:city)
  end

end
