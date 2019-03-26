class AddTotalToHeb < ActiveRecord::Migration
  def change
    add_column :hebs, :total, :string
  end
end
