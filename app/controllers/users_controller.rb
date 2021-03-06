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
        
        respond_to do |format|
            if @user.save
                # Tell the UserMailer to send a welcome email after save
                UserMailer.with(user: @user).welcome_email.deliver_later
                
                format.html { redirect_to(@user, notice: 'User was successfully created.') }
                format.json { render json: @user, status: :created, location: @user }
            else
                format.html { render action: 'new' }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :email)
    end
end
