class RemoveValueFromTargetcoupon < ActiveRecord::Migration
  def change
    remove_column :targetcoupons, :value, :integer
  end
end
