class AddValue1ToKrogercheckout51 < ActiveRecord::Migration
  def change
    add_column :krogercheckout51s, :value1, :string
    add_column :krogercheckout51s, :value2, :string
    add_column :krogercheckout51s, :store1, :string
    add_column :krogercheckout51s, :store2, :string
  end
end
