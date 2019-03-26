class AddRepeatersToManytables < ActiveRecord::Migration
  def change
    add_column :targetibotta, :repeaters, :array
    add_column :krogertargetcoupons, :repeaters, :array
    add_column :table_krogertargetcoupons, :repeaters, :array
    add_column :ibottasavingstars, :repeaters, :array
  end
end