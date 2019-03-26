class AddCopiesToKrogercheckout51 < ActiveRecord::Migration
  def change
    add_column :krogercheckout51s, :copies, :integer
    
  end
end



  