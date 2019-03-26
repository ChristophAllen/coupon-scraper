class AddStoreToIbotta < ActiveRecord::Migration
  def change
    add_column :ibotta, :store, :string
  end
end
