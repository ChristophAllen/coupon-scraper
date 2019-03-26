class AddTitle1ToIbottasavingstar < ActiveRecord::Migration
  def change
    add_column :ibottasavingstars, :title1, :string
  end
end
