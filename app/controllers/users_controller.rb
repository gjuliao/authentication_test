class UsersController < ApplicationController

  before_action :authorized, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "User successfully created"
          redirect_to root_path
        else
          flash[:error] = "Something went wrong"
          render 'new', status: :unprocessable_entity
        end
    end

    def show
      @user = User.find_by(id: params[:id])
    end
    

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end