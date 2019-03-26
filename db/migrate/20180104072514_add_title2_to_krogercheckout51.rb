class AddTitle2ToKrogercheckout51 < ActiveRecord::Migration
  def change
    add_column :krogercheckout51s, :title2, :string
  end
end
