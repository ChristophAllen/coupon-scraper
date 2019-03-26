class DropKroger < ActiveRecord::Migration
  def change
    drop_table :kroger
  end
end
