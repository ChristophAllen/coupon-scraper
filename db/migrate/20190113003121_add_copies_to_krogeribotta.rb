class AddCopiesToKrogeribotta < ActiveRecord::Migration
  def change
    add_column :krogeribotta, :copies, :integer
  end
end
