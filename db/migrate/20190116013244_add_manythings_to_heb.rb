class AddManythingsToHeb < ActiveRecord::Migration
  def change
    add_column :hebs, :title, :string
    add_column :hebs, :value, :string
    add_column :hebs, :link, :string
    add_column :hebs, :repeaters, :array
    add_column :hebs, :store, :string
  end
end
