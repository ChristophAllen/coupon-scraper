class AddValueToTargetcoupon < ActiveRecord::Migration
  def change
    add_column :targetcoupons, :value, :string
  end
end
