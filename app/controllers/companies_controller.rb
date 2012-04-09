class CompaniesController < ApplicationController

  def show
    @companies = Company.all
    @company = Company.find(params[:id])
    render :layout => 'home' if !request.headers['X-PJAX'] && !params[:_pjax] == true
  end

  def new
    @company = Company.new
  end

  def thanks
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      flash[:success] = "Added"
      redirect_to thanks_company_url(@company)
    else
      render :new
    end
  end
end