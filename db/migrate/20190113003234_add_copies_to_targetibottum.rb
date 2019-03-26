class AddCopiesToTargetibottum < ActiveRecord::Migration
  def change
    add_column :targetibotta, :copies, :integer
  end
end
