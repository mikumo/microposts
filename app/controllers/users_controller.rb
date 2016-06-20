class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit,:update]
  
  def new
    @user = User.new
  end
  

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc).page(params[:page]).per(3)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  @user = User.find(params[:id])
  end
  
  def update
  @user = User.find(params[:id])
   if @user.update_attributes(user_params)
     flash[:success]="Profile updated"
     redirect_to@user
   else
    render'edit'
   end
  end
  
  def followings
    @title = "Followings"
    @user  = User.find(params[:id])
    @users = @user.following_users
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.follower_users
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :location,
                                 :password_confirmation)
  end

  
end