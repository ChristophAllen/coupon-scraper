class AddRepeatersToKroger < ActiveRecord::Migration
  def change
    add_column :krogers, :repeaters, :array
  end
end
