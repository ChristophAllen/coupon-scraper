class AddValue2ToIbottasavingstar < ActiveRecord::Migration
  def change
    add_column :ibottasavingstars, :value2, :string
  end
end
