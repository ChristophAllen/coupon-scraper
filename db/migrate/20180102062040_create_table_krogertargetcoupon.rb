class CreateTableKrogertargetcoupon < ActiveRecord::Migration
  def change
    create_table :table_krogertargetcoupons do |t|
      t.string :title1
      t.string :title2
      t.string :value1
      t.string :value2
      t.string :link1
      t.string :link2
      t.string :store1
      t.string :store2
      t.string :repeaters
    end
  end
end