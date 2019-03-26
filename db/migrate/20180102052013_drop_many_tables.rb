class DropManyTables < ActiveRecord::Migration
  def change
    drop_table :krogertargetcoupon #
    drop_table :krogercheckout51 #
    drop_table :krogersavingstar
    drop_table :checkout51targetcoupon
    drop_table :checkout51savingstar
    drop_table :targetcouponsavingstar
  end
end