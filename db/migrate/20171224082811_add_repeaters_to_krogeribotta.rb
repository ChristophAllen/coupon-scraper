class AddRepeatersToKrogeribotta < ActiveRecord::Migration
  def change
    add_column :krogeribotta, :repeaters, :string
  end
end
