class AssetsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @assets = Asset.page(params[:page])
  end
  
  def show
  end
  
  def new
  end
  
  def create
    @asset = Asset.new(params[:asset])
    if @asset.save
      flash[:notice] = "Successfully created asset."
      redirect_to '/asset'
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @asset.update_attributes(params[:asset])
      flash[:notice] = "Successfully updated asset."
      redirect_to '/asset'
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @asset.destroy
    flash[:notice] = "Successfully destroyed asset."
    redirect_to '/asset'
  end
end
