class AddTotalToHyvee < ActiveRecord::Migration
  def change
    add_column :hyvees, :total, :string
  end
end
