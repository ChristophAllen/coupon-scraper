class CreateTriplesaves < ActiveRecord::Migration
  def change
    create_table :triplesaves do |t|
      t.string :title1
      t.string :title2
      t.string :title3
      t.string :value1
      t.string :value2
      t.string :value3
      t.string :link1
      t.string :link2
      t.string :link3
      t.string :store1
      t.string :store2
      t.string :store3
      t.string :repeaters
      t.timestamps null: false
    end
  end
end
