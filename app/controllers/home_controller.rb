class HomeController < ApplicationController
	before_filter :authenticate_user!
	#load_and_authorize_resource

	def index
		#authorize! :index, @user, :message => 'Nao autorizado somente administradores'
		#debugger
		#@users_device = UsersDevice.where(params[:user_id])
	end
end
