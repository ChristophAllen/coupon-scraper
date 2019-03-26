class ChangeSmithsTableName < ActiveRecord::Migration
  def self.up
    rename_table :smiths, :kroger
  end
end
