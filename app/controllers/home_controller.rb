class HomeController < ApplicationController

	before_filter :authenticate_user!

	def index
		#authorize! :index, @user, :message => 'Nao autorizado somente administradores'
	end
end
