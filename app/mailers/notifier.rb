class Notifier < ActionMailer::Base
  default :from => "Travis Graham <tgraham@shknox.com>"
  default :to => "Travis Graham <tgraham@shknox.com>"
  
  def reset_email(user)
    @user = user
    @url  = edit_password_reset_url(user.perishable_token)
    mail( :to => "#{user.first_name+' '+user.last_name} <#{user.email}>",
          :subject => "Tickets, Tickets password reset instructions")
  end
  
  def welcome_email(user)
    @user = user
    @url  = "http://tickets.smithandhammaker.com/login"
    mail( :to => "#{user.first_name+' '+user.last_name} <#{user.email}>",
          :subject => "Welcome to Tickets, Tickets")
  end
  
  def new_ticket_email(user)
    @user = user
    @url  = "http://tickets.smithandhammaker.com/login"
    mail( :to => "#{user.first_name+' '+user.last_name} <#{user.email}>",
          :subject => "New Ticket Submitted")
  end
end
