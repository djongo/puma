class Role < ActiveRecord::Base
  attr_accessible :name, :show_name
  has_many :assignments
  has_many :users, :through => :assignments
end
