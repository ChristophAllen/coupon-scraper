class AddStoreToSavingstar < ActiveRecord::Migration
  def change
    add_column :savingstars, :store, :string
  end
end
