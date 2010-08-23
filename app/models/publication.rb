class Publication < ActiveRecord::Base
  #attr_accessible :title, :publication_type_id, :language_id, :description, :keyword_ids, :user_ids, :variable_ids
#  include Workflow
  belongs_to :language
  belongs_to :publication_type
  has_many :categorizations
  has_many :keywords, :through => :categorizations
  has_many :authorships
  has_many :users, :through => :authorships  
  has_many :determinants
  has_many :variables, :through => :determinants  
  has_many :keywords
  has_many :variables, :through => :keywords  

  has_many :mediators
  has_many :variables, :through => :mediators  
  has_many :outcomes
  has_many :variables, :through => :outcomes  


  has_many :foundations
  has_many :surveys, :through => :foundations  

  has_many :inclusions
  has_many :populations, :through => :inclusions  


  validates_presence_of :title
  validates_associated :variables
  validates_associated :surveys
  validates_associated :populations
  validates_associated :users
  accepts_nested_attributes_for :determinants, 
                                :allow_destroy => true, 
                                :reject_if => proc { |attrs| attrs['variable_name'].blank? }
  
  accepts_nested_attributes_for :outcomes, 
                                :allow_destroy => true, 
                                :reject_if => proc { |attrs| attrs['variable_name'].blank? }                                
  
  accepts_nested_attributes_for :mediators, 
                                :allow_destroy => true, 
                                :reject_if => proc { |attrs| attrs['variable_name'].blank? }                                

  accepts_nested_attributes_for :keywords, 
                                :allow_destroy => true, 
                                :reject_if => proc { |attrs| attrs['variable_name'].blank? }    

  accepts_nested_attributes_for :foundations, 
                                :allow_destroy => true, 
                                :reject_if => proc { |attrs| attrs['survey_name'].blank? &&
                                  attrs['survey_id'].blank? }  
                                
  accepts_nested_attributes_for :inclusions, 
                                :allow_destroy => true, 
                                :reject_if => proc { |attrs| attrs['population_name'].blank? &&
                                  attrs['population_id'].blank? }       
  accepts_nested_attributes_for :authorships, 
                                :allow_destroy => true, 
                                :reject_if => proc { |attrs| attrs['user_name'].blank? &&
                                  attrs['user_id'].blank? }    
  accepts_nested_attributes_for :users        
  
  define_index do
    indexes title
    indexes description
#    indexes variables.name, :as => :variable_name
#    indexes users.first_name
#    indexes users.last_name
#    indexes [users.first_name, users.last_name], :as => :author_name
  end                          
  
  workflow do
    state :pre_planned do
      event :submit_for_planned, :transitions_to => :planned
    end
    state :planned do
      event :submit_for_in_progress, :transitions_to => :in_progress
    end
    state :in_progress do
      event :submit_for_submitted, :transitions_to => :submitted
    end
    state :submitted do
      event :submit_for_accepted, :transitions_to => :accepted
    end
    state :accepted do
      event :submit_for_published, :transitions_to => :published
    end
    
    state :published
    
  end #workflow
  
end
