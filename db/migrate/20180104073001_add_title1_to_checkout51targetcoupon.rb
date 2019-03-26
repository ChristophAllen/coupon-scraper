class AddTitle1ToCheckout51targetcoupon < ActiveRecord::Migration
  def change
    add_column :checkout51targetcoupons, :title1, :string
    add_column :checkout51targetcoupons, :title2, :string
    add_column :checkout51targetcoupons, :store1, :string
    add_column :checkout51targetcoupons, :store2, :string
    add_column :checkout51targetcoupons, :link1, :string
    add_column :checkout51targetcoupons, :link2, :string
    add_column :checkout51targetcoupons, :value1, :string
    add_column :checkout51targetcoupons, :value22, :string
    add_column :checkout51targetcoupons, :repeaters, :string
  end
end
