class TicketsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @tickets = Ticket.page(params[:page])
  end
  
  def new
  end
  
  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.user_id = current_user.id
    @ticket.status = 'Open'
    if @ticket.save
      # Notifier.new_ticket_email(@user).deliver
      flash[:notice] = "Successfully created ticket."
      redirect_to '/ticket'
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @ticket.update_attributes(params[:ticket])
      flash[:notice] = "Successfully updated ticket."
      redirect_to '/ticket'
    else
      render :action => 'edit'
    end
  end
  
  def show
    @reply = Reply.new
  end
  
  def destroy
    @ticket.destroy
    flash[:notice] = "Successfully removed ticket."
    redirect_to '/ticket'
  end
end
