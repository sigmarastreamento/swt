class UsersController < ApplicationController
    before_filter :authenticate_user!
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    
    def index
        @users = User.all
      end
    
    def show
    end
    
    def new
			@user = User.new
    end
    
    def edit
    end
    
def create
    @user = User.new(params[:user])
	
    if @user.save
      flash[:notice] = "#{ @user.email } created."
      redirect_to root_path, :notice => 'Cadastro criado com sucesso!'
    else
      render :action => 'new'
    end
  end
    
      def update
				if params[:user][:password].blank?
					params[:user].delete(:password)
					params[:user].delete(:password_confirmation)
				end
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to @user, notice: 'User setting was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end
    

      def destroy
				debugger
        @user.destroy
				redirect_to root_path
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:id])
        end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def user_params
          #params[:user]
          params.require(:user).permit(:email, :password, :password_confirmation, :admin, :id)
        end
    end 
