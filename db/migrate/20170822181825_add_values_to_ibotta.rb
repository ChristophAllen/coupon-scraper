class AddValuesToIbotta < ActiveRecord::Migration
  def change
    add_column :ibotta, :values, :string
  end
end
