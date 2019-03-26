class AddValueToTargetibottum < ActiveRecord::Migration
  def change
    add_column :targetibotta, :value, :string
  end
end
