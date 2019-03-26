class RenameIbottaValues < ActiveRecord::Migration
  def self.up
    rename_column :ibotta, :values, :value
  end
end
