class CreateKrogeribotta < ActiveRecord::Migration
  def change
    create_table :krogeribotta do |t|
      t.string :title1, null: false
      t.string :title2, null: false
      t.string :value1, null: false
      t.string :value2, null: false
      t.string :link1, null: false
      t.string :link2, null: false
      t.timestamps null: false
    end
  end
end