class UsersController < ApplicationController
	before_filter :authenticate_user!
	
  def index
	  authorize! :index, @user, :message => 'Nao autorizado somente administradores'
	  @users = User.all	  
  end

  def show
	  @user = User.find(params[:id])
  end
end
