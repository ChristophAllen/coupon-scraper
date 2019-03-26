class AddCompleteToKrogertargetcoupon < ActiveRecord::Migration
  def change
    add_column :krogertargetcoupons, :complete, :boolean
  end
end
