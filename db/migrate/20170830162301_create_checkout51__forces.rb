class CreateCheckout51Forces < ActiveRecord::Migration
  def change
    create_table :checkout51__forces do |t|

      t.timestamps null: false
    end
  end
end
