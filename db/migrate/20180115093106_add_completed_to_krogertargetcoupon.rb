class AddCompletedToKrogertargetcoupon < ActiveRecord::Migration
  def change
    add_column :krogertargetcoupons, :completed, :true
  end
end
