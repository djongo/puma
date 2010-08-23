class Foundation < ActiveRecord::Base
  belongs_to :publication
  belongs_to :survey

  def survey_name
    survey.name if survey
  end
  
  #def survey_name=(name)
  #  self.survey = Survey.find_or_create_by_name(name) unless name.blank?
  #end
  
end
