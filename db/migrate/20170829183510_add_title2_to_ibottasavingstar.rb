class AddTitle2ToIbottasavingstar < ActiveRecord::Migration
  def change
    add_column :ibottasavingstars, :title2, :string
  end
end
