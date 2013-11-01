class PositionController < ApplicationController
	# GET /positions
	# GET /positions.json
	def index
		@positions = Position.all
      	respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @positions.to_json(root: false) }
      	end
  	end
	
  def show
  end
end
