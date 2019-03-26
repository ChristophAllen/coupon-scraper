class AddManycolumnsToSmith2 < ActiveRecord::Migration
  def change
    add_column :smith2s, :total, :integer
    add_column :smith2s, :title, :string
    add_column :smith2s, :value, :string
    add_column :smith2s, :link, :string
    add_column :smith2s, :store, :string
  end
end
