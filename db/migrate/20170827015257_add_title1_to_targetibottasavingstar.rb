class AddTitle1ToTargetibottasavingstar < ActiveRecord::Migration
  def change
    add_column :targetibottasavingstars, :title1, :string
  end
end
