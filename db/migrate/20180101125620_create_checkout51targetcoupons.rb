class CreateCheckout51targetcoupons < ActiveRecord::Migration
  def change
    create_table :checkout51targetcoupons do |t|

      t.timestamps null: false
    end
  end
end
