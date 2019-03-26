class AddTitle1ToKrogercheckout51 < ActiveRecord::Migration
  def change
    add_column :krogercheckout51s, :title1, :string
  end
end
