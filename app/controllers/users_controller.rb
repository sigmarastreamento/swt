class UsersController < ApplicationController
	before_filter :authenticate_user!
	
	# GET /users
	# GET /users.json
	def index
		@users = User.all
      	respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @users.to_json(root: false) }
      	end
  	end	
	
#	def index
#	  #authorize! :index, @user, :message => 'Nao autorizado somente administradores'
#	  @users = User.all	  
#  end

  def show
	  @user = User.find(params[:id])
  end
end
