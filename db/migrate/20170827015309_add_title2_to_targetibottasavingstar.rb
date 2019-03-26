class AddTitle2ToTargetibottasavingstar < ActiveRecord::Migration
  def change
    add_column :targetibottasavingstars, :title2, :string
  end
end
