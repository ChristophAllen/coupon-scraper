class AddTotalToIbotta < ActiveRecord::Migration
  def change
    add_column :ibotta, :total, :string
  end
end
