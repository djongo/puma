class AddOrderToAuthorships < ActiveRecord::Migration
  def self.up
    add_column :authorships, :order, :integer
  end

  def self.down
    remove_column :authorships, :order
  end
end
