class RepliesController < ApplicationController
  load_and_authorize_resource
  
  def new
  end
  
  def create
    @reply = Reply.new(params[:reply])
    @reply.user_id = current_user.id
    
    if @reply.user.try(:role) == 'admin'
      @reply.ticket.status = 'Answered'
    else
      @reply.ticket.status = 'Customer-Reply'
    end
    
    if @reply.save
      flash[:notice] = "Successfully added reply."
      redirect_to '/ticket'
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @reply.update_attributes(params[:reply])
      flash[:notice] = "Successfully updated reply."
      redirect_to '/ticket'
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @reply.destroy
    flash[:notice] = "Successfully removed reply."
    redirect_to '/ticket'
  end
end
