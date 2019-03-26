class AddTotalToTargetcoupon < ActiveRecord::Migration
  def change
    add_column :targetcoupons, :total, :string
  end
end
