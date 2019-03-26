class AddStoreToTargetcoupon < ActiveRecord::Migration
  def change
    add_column :targetcoupons, :store, :string
  end
end
