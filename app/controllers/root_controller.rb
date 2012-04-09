class RootController < ApplicationController
  layout 'home'

  def index
    @companies = Company.where(:current_state => 'active')
  end
end