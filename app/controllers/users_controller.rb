class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash.now[:success] = "Your account has been created !"
      redirect_to '/'
    else
      flash.now[:danger] = "Your account creation has failed !"
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash.now[:success] = "You successfully updated your profil !"
    redirect_to @user
  end

  def index
    if logged_in?
      @user = User.all
    else
      flash.now[:alert] = "You need to be logged in to access this page."
      redirect_to '/login'
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      flash.now[:alert] = "You need to be logged in to access this page."
      redirect_to '/login'
    end
  end

private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password)
  end
end
