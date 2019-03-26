class Targetibotta < ActiveRecord::Migration
  def change
      create_table :targetibottum do |t|
        t.column :title, :string, :presence => true, :uniqueness => true

        t.timestamps null: false
    end
  end
end
