class SessionsController < ApplicationController
  layout false

  def new
  end

  def create
    reset_session

    user = User.find_by_login(params[:login])
    password_encripted = Digest::SHA1.hexdigest(params[:password])

    if user && user.password == password_encripted
      session[:user_id] = user.id
      redirect_to books_path
    else
      flash.now[:notice] = "There was a mistake here. Please, try again"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end