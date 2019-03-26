class AddCopiesToDoublesaver < ActiveRecord::Migration
  def change
    add_column :doublesavers, :copies, :integer
  end
end
