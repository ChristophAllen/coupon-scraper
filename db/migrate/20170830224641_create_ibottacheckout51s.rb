class CreateIbottacheckout51s < ActiveRecord::Migration
  def change
    create_table :ibottacheckout51s do |t|
      
      t.column :title1, :string, :presence => true, :uniqueness => true
      t.column :title2, :string, :presence => true, :uniqueness => true
      t.column :value1, :string, :presence => true, :uniqueness => true
      t.column :value2, :string, :presence => true, :uniqueness => true
      t.column :link1, :string, :presence => true, :uniqueness => true
      t.column :link2, :string, :presence => true, :uniqueness => true
      t.column :store1, :string, :presence => true, :uniqueness => true
      t.column :store2, :string, :presence => true, :uniqueness => true


      t.timestamps null: false
    end
  end
end
