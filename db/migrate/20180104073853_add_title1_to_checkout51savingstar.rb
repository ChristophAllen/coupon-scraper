class AddTitle1ToCheckout51savingstar < ActiveRecord::Migration
  def change
    add_column :checkout51savingstars, :title1, :string
    add_column :checkout51savingstars, :title2, :string
    add_column :checkout51savingstars, :value1, :string
    add_column :checkout51savingstars, :value2, :string
    add_column :checkout51savingstars, :link1, :string
    add_column :checkout51savingstars, :link2, :string
    add_column :checkout51savingstars, :store1, :string
    add_column :checkout51savingstars, :store2, :string
    add_column :checkout51savingstars, :repeaters, :string
  end
end
