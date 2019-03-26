class AddStore1ToTargetibottum < ActiveRecord::Migration
  def change
    add_column :targetibotta, :store1, :string
    add_column :targetibotta, :store2, :string
  end
end
