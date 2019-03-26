class AddTotalToMeijer < ActiveRecord::Migration
  def change
    add_column :meijers, :total, :string
  end
end
