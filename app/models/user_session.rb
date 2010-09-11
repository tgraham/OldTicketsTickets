class UserSession < Authlogic::Session::Base
  def remember_me_for
    2.weeks
  end
  
  def to_key 
    new_record? ? nil : [ self.send(self.class.primary_key) ] 
  end
end