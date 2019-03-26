class AddLinkToSavingstar < ActiveRecord::Migration
  def change
    add_column :savingstars, :link, :string
    add_column :savingstars, :string, :string
  end
end
