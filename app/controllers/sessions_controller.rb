class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_or_create_from_omniauth(env['omniauth.auth'])
    if user
      session[:user_id] = user.id
      redirect_to admin_root_url
    else
      failure
    end
  end

  def destroy
    logout
  end

  def failure
    flash[:error] = t('header.login_error')
    redirect_to signin_url
  end
end