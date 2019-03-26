class AddTotalToCheckout51 < ActiveRecord::Migration
  def change
    add_column :checkout51s, :total, :string
  end
end
