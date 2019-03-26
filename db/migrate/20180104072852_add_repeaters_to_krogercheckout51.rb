class AddRepeatersToKrogercheckout51 < ActiveRecord::Migration
  def change
    add_column :krogercheckout51s, :repeaters, :string
  end
end
