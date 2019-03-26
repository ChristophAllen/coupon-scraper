class RemoveValueFromTargetibottum < ActiveRecord::Migration
  def change
    remove_column :targetibotta, :value, :string
  end
end
