# frozen_string_literal: true

class StaffsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :authenticate_admin, only: [:destroy]
  before_action :set_staff, only: %i[show edit update destroy]

  # GET /staffs
  # GET /staffs.json
  def index
    if params["search"].present? && !params["search"]["input_search"].blank?
      query = "%#{params['search']['input_search']}%"
      @staffs = Staff.where("name ILIKE ? OR surname ILIKE ? OR pesel ILIKE ?", query, query, query)
    else
      @staffs = Staff.all
    end
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show; end

  # GET /staffs/new
  def new
    @staff = Staff.new
    @staff.build_address
  end

  # GET /staffs/1/edit
  def edit; end

  # POST /staffs
  # POST /staffs.json
  def create
    @staff = Staff.new(staff_params)

    respond_to do |format|
      if @staff.save
        format.html { redirect_to @staff, notice: "Staff was successfully created." }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staffs/1
  # PATCH/PUT /staffs/1.json
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to @staff, notice: "Staff was successfully updated." }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: "Staff was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.require(:staff).permit(:name, :surname, :pesel, :occupation, :search, address_attributes: %i[city street_name street_no postal_code id])
    end
end
