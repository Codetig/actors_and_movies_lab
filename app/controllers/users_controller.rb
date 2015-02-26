class UsersController < ApplicationController

  before_action :prevent_login_signup, only: [:login, :signup]

  def signup 
    @user = User.new
  end

  def login
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "You have signed out"
    redirect_to '/'
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welome #{@user.username}"
      redirect_to '/'
    else
      flash[:notice] = "Please privide the appropriate username and password"
      render :signup
    end
  end

  def attempt_login
    session[:user_id] = []
    if params[:username].present? && params[:password].present?
    found_user = User.find_by username: params[:username]
      if found_user
        @user = found_user.authenticate(params[:password])
        flash[:notice] = "Welome #{@user.username}"
        session[:user_id] << @user.id
      redirect_to '/'

      else
        session[:user_id] = nil
        render :login
      end
    else
      session[:user_id] = nil
      render :login
    end
  end

  private

  def prevent_login_signup
    if session[:user_id]
      flash[:notice] = "You are already signed in"
      redirect_to '/'
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_digest)
  end
end
