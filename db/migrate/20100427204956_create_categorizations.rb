class CreateCategorizations < ActiveRecord::Migration
  def self.up
    create_table :categorizations do |t|
      t.integer :publication_id
      t.integer :keyword_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :categorizations
  end
end
