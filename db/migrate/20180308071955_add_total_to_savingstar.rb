class AddTotalToSavingstar < ActiveRecord::Migration
  def change
    add_column :savingstars, :total, :string
  end
end
