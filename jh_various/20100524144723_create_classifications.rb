class CreateClassifications < ActiveRecord::Migration
  def self.up
    create_table :classifications do |t|
      t.integer :publication_id
      t.integer :variable_id
      t.integer :type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :classifications
  end
end
