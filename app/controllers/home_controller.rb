class HomeController < ApplicationController
	before_filter :authenticate_user!
	#load_and_authorize_resource

	def index
        @last_positions = current_user.last_positions.to_json

	    respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @users.last_positions.to_json(root: false) }
        end            
	end
end
