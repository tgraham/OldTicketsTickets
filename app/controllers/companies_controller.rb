class CompaniesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @companies = Company.paginate :page => params[:page]
  end
  
  def new
    @company = Company.new
  end
  
  def create
    @company = Company.new(params[:company])
    if @company.save
      flash[:notice] = "Successfully created company."
      redirect_to '/company'
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @company.update_attributes(params[:company])
      flash[:notice] = "Successfully updated company."
      redirect_to '/company'
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @company.destroy
    flash[:notice] = "Successfully removed company."
    redirect_to '/company'
  end
end
