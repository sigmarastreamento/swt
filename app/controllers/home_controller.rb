class HomeController < ApplicationController

	before_filter :authenticate_user!

	def index
		#authorize! :index, @user, :message => 'Nao autorizado somente administradores'
		@users = User.all
		
		@devices = Device.all
		
		@positions = Position.all
		
		@usersdevices = UsersDevice.all
		
		@applicationsettings = ApplicationSettings.all
		
		@usersettings = UserSettings.all
	end
end
