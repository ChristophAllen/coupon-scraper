class AddManythingsToPublix < ActiveRecord::Migration
  def change
    add_column :publixes, :title, :string
    add_column :publixes, :value, :string
    add_column :publixes, :link, :string
    add_column :publixes, :repeaters, :array
    add_column :publixes, :store, :string
  end
end
