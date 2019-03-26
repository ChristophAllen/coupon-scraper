class CreateCheckout51savingstars < ActiveRecord::Migration
  def change
    create_table :checkout51savingstars do |t|

      t.timestamps null: false
    end
  end
end
