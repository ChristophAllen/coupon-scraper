class AddLinkToIbotta < ActiveRecord::Migration
  def change
    add_column :ibotta, :link, :string
    add_column :ibotta, :string, :string
  end
end
