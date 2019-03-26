class Savingstar < ActiveRecord::Migration
  def change
      create_table :savingstar do |t|
      t.column :title, :string, :presence => true, :uniqueness => true

      t.timestamps null: false
    end
  end
end
