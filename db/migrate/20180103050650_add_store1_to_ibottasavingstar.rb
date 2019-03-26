class AddStore1ToIbottasavingstar < ActiveRecord::Migration
  def change
    add_column :ibottasavingstars, :store1, :string
    add_column :ibottasavingstars, :store2, :string
  end
end
