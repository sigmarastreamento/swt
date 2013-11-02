class UsersDevicesController < ApplicationController
  before_action :set_users_device, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /users_devices
  # GET /users_devices.json
  def index
    @users_devices = UsersDevice.all
	  respond_to do |format|
		  format.html # show.html.erb
		  format.json { render json: @users_devices.to_json(root: false) }
	  end
  end

  # GET /users_devices/1
  # GET /users_devices/1.json
  def show
  end

  # GET /users_devices/new
  def new
    @users_device = UsersDevice.new
  end

  # GET /users_devices/1/edit
  def edit
  end

  # POST /users_devices
  # POST /users_devices.json
  def create
    @users_device = UsersDevice.new(users_device_params)

    respond_to do |format|
      if @users_device.save
        format.html { redirect_to @users_device, notice: 'Users device was successfully created.' }
        format.json { render action: 'show', status: :created, location: @users_device }
      else
        format.html { render action: 'new' }
        format.json { render json: @users_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_devices/1
  # PATCH/PUT /users_devices/1.json
  def update
    respond_to do |format|
      if @users_device.update(users_device_params)
        format.html { redirect_to @users_device, notice: 'Users device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @users_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_devices/1
  # DELETE /users_devices/1.json
  def destroy
    @users_device.destroy
    respond_to do |format|
      format.html { redirect_to users_devices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_device
      @users_device = UsersDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_device_params
      params[:users_device]
    end
end
