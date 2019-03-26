class AddValue1ToIbottasavingstar < ActiveRecord::Migration
  def change
    add_column :ibottasavingstars, :value1, :string
  end
end
