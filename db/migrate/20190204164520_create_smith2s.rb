class CreateSmith2s < ActiveRecord::Migration
  def change
    create_table :smith2s do |t|
      
    add_column :users, :total, :integer
    add_column :users, :title, :string
    add_column :users, :value, :string
    add_column :users, :link, :string
    add_column :users, :store, :string      

      t.timestamps null: false
    end
  end
end
