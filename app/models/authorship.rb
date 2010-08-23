class Authorship < ActiveRecord::Base
  belongs_to :publication
  belongs_to :user

  def user_name
    user.full_name if user
  end
  
  #def user_name=(name)
  #  self.user = User.find_or_create_by_user_name(@full_name) unless @full_name.blank?
  #end
  
  
end
