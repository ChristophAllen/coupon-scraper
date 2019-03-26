class AddTitleToSavingstars < ActiveRecord::Migration
  def change
    add_column :savingstars, :title, :string
  end
end
