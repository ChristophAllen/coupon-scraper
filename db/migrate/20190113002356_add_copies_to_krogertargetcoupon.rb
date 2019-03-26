class AddCopiesToKrogertargetcoupon < ActiveRecord::Migration
  def change
    add_column :krogertargetcoupons, :copies, :integer
  end
end
