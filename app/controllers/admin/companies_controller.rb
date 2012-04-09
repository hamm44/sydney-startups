class Admin::CompaniesController < AdminController
  before_filter :load, :only => [:edit, :update, :destroy]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      @company.enable! if params[:enable] == "true"
      redirect_to admin_companies_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    @company.update_attributes(params[:company])
    @company.enable! if params[:enable] == "true"
    redirect_to edit_admin_company_url(@company)
  end

  def destroy
    @company.destroy
    redirect_to admin_companies_url
  end

  private
    def load
      @company = Company.find(params[:id])
    end
end