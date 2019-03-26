class AddRepeatersToSavingstar < ActiveRecord::Migration
  def change
    add_column :savingstars, :repeaters, :array
  end
end
