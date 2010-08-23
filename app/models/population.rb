class Population < ActiveRecord::Base
  using_access_control
  attr_accessible :name
  has_many :inclusions
  has_many :publications, :through => :inclusions  
  validates_presence_of :name
end
