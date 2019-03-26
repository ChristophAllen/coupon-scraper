class AddCopiesToTherest < ActiveRecord::Migration
  def change
    add_column :checkout51targetcoupons, :copies, :integer
    add_column :checkout51savingstars, :copies, :integer
    add_column :targetcouponsavingstars, :copies, :integer
    add_column :ibottacheckout51s, :copies, :integer
    add_column :ibottasavingstars, :copies, :integer
  end
end

