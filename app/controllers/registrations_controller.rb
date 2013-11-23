class RegistrationsController < Devise::RegistrationsController
	load_and_authorize_resource
	def new
		super
	end

	def create
		super
	end
	def edit
		super
	end
    
	def update
		super
	end
end 