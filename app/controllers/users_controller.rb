class UsersController < ApplicationController

  def new
    @identity = env['omniauth.identity']
  end

  def failed
    flash[:error] = "FAILED"
    redirect_to root_user
  end
end