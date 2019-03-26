class RemoveRepeatersFromTargetibotta < ActiveRecord::Migration
  def change
    remove_column :targetibotta, :repeaters
    remove_column :krogertargetcoupons, :repeaters
    remove_column :table_krogertargetcoupons, :repeaters
    remove_column :ibottasavingstars, :repeaters
  end
end
