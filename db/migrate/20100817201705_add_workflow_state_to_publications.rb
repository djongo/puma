class AddWorkflowStateToPublications < ActiveRecord::Migration
  def self.up
    add_column :publications, :workflow_state, :string
  end

  def self.down
    remove_column :publications, :workflow_state
  end
end
