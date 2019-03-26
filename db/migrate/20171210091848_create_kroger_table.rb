class CreateKrogerTable < ActiveRecord::Migration
  def change
    create_table :kroger_tables do |t|
      t.integer :value, null: false
      t.string :store, null: false
      t.string :title, null: false
      t.string :link, null: false
    end
  end
end