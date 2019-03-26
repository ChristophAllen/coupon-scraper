class CreateDoublesavers < ActiveRecord::Migration
  def change
    create_table :doublesavers do |t|
      t.string :title1
      t.string :title2
      t.string :value1
      t.string :value2
      t.string :link1
      t.string :link2
      t.string :repeaters
      t.string :store1
      t.string :store2

      t.timestamps null: false
    end
  end
end
