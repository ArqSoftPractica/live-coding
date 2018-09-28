class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
    end

    def posts
        @user = User.find(params[:id])
        @posts = Post.where user_id: params[:id]
    end

    def create
        @user = User.new(user_params)
        @user.save
        redirect_to @user
    end
    
    def show
        @user = User.find(params[:id])
    end

    private
        def user_params
            params.require(:user).permit(:name)
        end
end
