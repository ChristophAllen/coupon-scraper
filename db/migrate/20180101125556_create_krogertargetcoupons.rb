class CreateKrogertargetcoupons < ActiveRecord::Migration
  def change
    create_table :krogertargetcoupons do |t|

      t.timestamps null: false
    end
  end
end
