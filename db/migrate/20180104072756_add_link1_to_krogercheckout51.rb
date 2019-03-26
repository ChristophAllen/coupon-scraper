class AddLink1ToKrogercheckout51 < ActiveRecord::Migration
  def change
    add_column :krogercheckout51s, :link1, :string
    add_column :krogercheckout51s, :link2, :string
  end
end
