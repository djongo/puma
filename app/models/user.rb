class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :role_ids, :publication_ids, :full_name, :publication_group?
  has_many :assignments
  has_many :roles, :through => :assignments
  has_many :authorships
  has_many :publications, :through => :authorships

  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
  
  def full_name
    [first_name, last_name].join(' ') 
  end

  def publication_group?
    role_symbols.each do |rs|
      if rs.to_s == "publication_group"
        return true
      end
    end
  end
end
