class CreateTargetibottasavingstars < ActiveRecord::Migration
  def change
    create_table :targetibottasavingstars do |t|

      t.timestamps null: false
    end
  end
end
