class UsersController < ApplicationController
    #before_filter :authenticate_user!
    load_and_authorize_resource
	
	# GET /users
	# GET /users.json
	def index
		@users = User.all
  	end
    def edit
	  @user = User.find(params[:id])
      respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @users.to_json(root: false) }
      end
    end
  
    def show
	  @user = User.find(params[:id])
    end
	
    def destroy
	  
    end
end
