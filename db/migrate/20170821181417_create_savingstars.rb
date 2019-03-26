class CreateSavingstars < ActiveRecord::Migration
  def change
    create_table :savingstars do |t|
        t.column :title, :string, :presence => true, :uniqueness => true

      t.timestamps null: false
    end
  end
end
