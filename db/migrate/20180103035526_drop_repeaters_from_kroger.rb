class DropRepeatersFromKroger < ActiveRecord::Migration
  def change
    remove_column :krogers, :repeaters
  end
end
