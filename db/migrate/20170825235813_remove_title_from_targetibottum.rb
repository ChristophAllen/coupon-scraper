class RemoveTitleFromTargetibottum < ActiveRecord::Migration
  def change
    remove_column :targetibotta, :title, :string
    remove_column :targetibotta, :string, :string
  end
end
