class AddLinkToTargetcoupon < ActiveRecord::Migration
  def change
    add_column :targetcoupons, :link, :string
    add_column :targetcoupons, :string, :string
  end
end
