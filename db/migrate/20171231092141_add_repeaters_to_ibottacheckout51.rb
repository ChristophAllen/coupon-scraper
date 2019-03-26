class AddRepeatersToIbottacheckout51 < ActiveRecord::Migration
  def change
    add_column :ibottacheckout51s, :repeaters, :string
  end
end
