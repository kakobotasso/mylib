class UsersController < ApplicationController
  before_filter :require_logged_user
  
  def index
    @title = I18n.t('users.index.title')
    @users = User.all
  end

  def new
    @title = I18n.t('users.new.title')
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @title = I18n.t('users.edit.title')
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      render :edit
    end 
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
 
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :login, :password)
  end
end
