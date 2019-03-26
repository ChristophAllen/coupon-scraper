class CreatingSmithsTable < ActiveRecord::Migration
  def change
    create_table :smiths do |t|
      t.string :title
      t.string :price
      t.string :store
      t.string :link      
 
      t.timestamps
    end
  end
end
