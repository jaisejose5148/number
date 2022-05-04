class UsersController < ApplicationController
	def index
        @users = User.all 
        render json: @users
    end 

    def show
        @user = User.find(params[:id])
        render json: @user
    end 

    def create
        @user = User.create(
            name: params[:name],
            
            email: params[:email]
        )
        render json: @user
    end 

    def update
        @user = User.find(params[:id])
        @user.update(
            name: params[:name],
            
            email: params[:email]
        )
        render json: @user
    end 

    def destroy
        @users = User.all 
        @user = User.find(params[:id])
        @user.destroy
        render json: @users
    end 
end
