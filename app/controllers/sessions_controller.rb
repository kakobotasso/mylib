class SessionsController < ApplicationController
  def new
    redirect_to dashboard_path if logged_in?
  end

  def create
    reset_session

    user = User.find_by_login(params[:login])
    password_encripted = Digest::SHA1.hexdigest(params[:password])

    if user && user.password == password_encripted
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash.now[:notice] = I18n.t('sessions.errors.login')
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end