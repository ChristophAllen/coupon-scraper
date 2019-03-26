class AddRepeatersToIbottasavingstar < ActiveRecord::Migration
  def change
    add_column :ibottasavingstars, :repeaters, :string
  end
end
