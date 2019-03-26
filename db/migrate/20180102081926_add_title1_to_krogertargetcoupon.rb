class AddTitle1ToKrogertargetcoupon < ActiveRecord::Migration
  def change
    add_column :krogertargetcoupons, :title1, :string
    add_column :krogertargetcoupons, :title2, :string
    add_column :krogertargetcoupons, :value1, :string
    add_column :krogertargetcoupons, :value2, :string
    add_column :krogertargetcoupons, :store1, :string
    add_column :krogertargetcoupons, :store2, :string
    add_column :krogertargetcoupons, :link1, :string
    add_column :krogertargetcoupons, :link2, :string
    add_column :krogertargetcoupons, :repeaters, :string
  end
end
