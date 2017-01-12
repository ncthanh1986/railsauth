class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new        
    end

    def create
        params[:user] = Hash.new
        params[:user][:first_name] = params[:full_name].split(" ").first
        params[:user][:last_name] = params[:full_name].split(" ").last
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "The user was added!"
            redirect_to root_path
        else 
            render 'new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
