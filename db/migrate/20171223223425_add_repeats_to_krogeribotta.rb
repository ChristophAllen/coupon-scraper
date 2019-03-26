class AddRepeatsToKrogeribotta < ActiveRecord::Migration
  def change
    add_column :krogeribotta, :repeats, :array
  end
end
