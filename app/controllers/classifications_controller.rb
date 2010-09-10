class ClassificationsController < ApplicationController
  load_and_authorize_resource
  
  def index
  end
  
  def new
  end
  
  def create
    @classification = Classification.new(params[:classification])
    if @classification.save
      flash[:notice] = "Successfully created classification."
      redirect_to classifications_path
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @classification.update_attributes(params[:classification])
      flash[:notice] = "Successfully updated classification."
      redirect_to @classification
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @classification.destroy
    flash[:notice] = "Successfully removed classification."
    redirect_to classifications_path
  end
end
