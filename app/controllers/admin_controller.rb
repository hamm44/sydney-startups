class AdminController < ApplicationController
  before_filter :admin_required

  def index
    redirect_to admin_users_path
  end

  private
    def admin_required
      redirect_to root_url if current_user.blank? || !current_user.admin
    end
end