class Variable < ActiveRecord::Base
  using_access_control
  attr_accessible :name, :publication_ids
  has_many :determinants
  has_many :publications, :through => :determinants
  has_many :keywords
  has_many :publications, :through => :keywords
  has_many :outcomes
  has_many :publications, :through => :outcomes
  has_many :mediators
  has_many :publications, :through => :mediators
  validates_presence_of :name
end
