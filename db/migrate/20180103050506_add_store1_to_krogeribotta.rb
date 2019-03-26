class AddStore1ToKrogeribotta < ActiveRecord::Migration
  def change
    add_column :krogeribotta, :store1, :string
    add_column :krogeribotta, :store2, :string
  end
end
