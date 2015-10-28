class Admin::PubliccommentsController < ApplicationController
  before_action :set_admin_publiccomment, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  before_action :check_admin

  layout "admin"
  # GET /admin/publiccomments
  # GET /admin/publiccomments.json
  def index
    @admin_publiccomments = Admin::Publiccomment.all
  end

  # GET /admin/publiccomments/1
  # GET /admin/publiccomments/1.json
  def show
  end

  # GET /admin/publiccomments/new
  def new
    @admin_publiccomment = Admin::Publiccomment.new
  end

  # GET /admin/publiccomments/1/edit
  def edit
  end

  # POST /admin/publiccomments
  # POST /admin/publiccomments.json
  def create
    @admin_publiccomment = Admin::Publiccomment.new(admin_publiccomment_params)

    respond_to do |format|
      if @admin_publiccomment.save
        format.html { redirect_to @admin_publiccomment, notice: 'Publiccomment was successfully created.' }
        format.json { render :show, status: :created, location: @admin_publiccomment }
      else
        format.html { render :new }
        format.json { render json: @admin_publiccomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/publiccomments/1
  # PATCH/PUT /admin/publiccomments/1.json
  def update
    respond_to do |format|
      if @admin_publiccomment.update(admin_publiccomment_params)
        format.html { redirect_to @admin_publiccomment, notice: 'Publiccomment was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_publiccomment }
      else
        format.html { render :edit }
        format.json { render json: @admin_publiccomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/publiccomments/1
  # DELETE /admin/publiccomments/1.json
  def destroy
    @admin_publiccomment.destroy
    respond_to do |format|
      format.html { redirect_to admin_publiccomments_url, notice: 'Publiccomment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_publiccomment
    @admin_publiccomment = Admin::Publiccomment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_publiccomment_params
    params[:admin_publiccomment]
  end
end
