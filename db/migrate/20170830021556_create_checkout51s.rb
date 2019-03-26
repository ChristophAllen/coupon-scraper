class CreateCheckout51s < ActiveRecord::Migration
  def change
    create_table :checkout51s do |t|
      t.column :title, :string, :presence => true, :uniqueness => true
      t.column :value, :string, :presence => true, :uniqueness => true
      t.column :store, :string, :presence => true, :uniqueness => true
      t.column :link, :string, :presence => true, :uniqueness => true

      t.timestamps null: false
    end
  end
end
