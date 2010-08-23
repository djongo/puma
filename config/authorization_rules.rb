authorization do
  role :publication_group do
    has_permission_on [:publications, :keywords, :variables, :focus_groups, :country_teams, :surveys, :populations, :determinants, :outcomes, :classifications, :publication_types], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on :publications, :to => [:auto_complete_for_variable_name]
    has_permission_on :assignments, :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on :users, :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on :languages, :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  role :author do
    has_permission_on :publications, :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on :keywords, :to => [:index, :show, :new, :create]
    has_permission_on :languages, :to => [:index, :show ]
    has_permission_on :variables, :to => [:index, :show, :new, :create ]
  end

  role :hbsc_member do
    has_permission_on :publications, :to => [:index, :show]
  end

  role :guest do
    has_permission_on :publications, :to => [:index, :show]
  end
  
end
