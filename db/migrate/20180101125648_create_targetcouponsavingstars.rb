class CreateTargetcouponsavingstars < ActiveRecord::Migration
  def change
    create_table :targetcouponsavingstars do |t|

      t.timestamps null: false
    end
  end
end
