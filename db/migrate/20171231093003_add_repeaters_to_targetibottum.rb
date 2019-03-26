class AddRepeatersToTargetibottum < ActiveRecord::Migration
  def change
    add_column :targetibotta, :repeaters, :string
  end
end
