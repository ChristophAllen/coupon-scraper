class AddTitle1ToTargetcouponsavingstar < ActiveRecord::Migration
  def change
    add_column :targetcouponsavingstars, :title1, :string
    add_column :targetcouponsavingstars, :title2, :string
    add_column :targetcouponsavingstars, :store1, :string
    add_column :targetcouponsavingstars, :store2, :string
    add_column :targetcouponsavingstars, :value1, :string
    add_column :targetcouponsavingstars, :value2, :string
    add_column :targetcouponsavingstars, :link1, :string
    add_column :targetcouponsavingstars, :link2, :string
    add_column :targetcouponsavingstars, :repeaters, :array
  end
end
