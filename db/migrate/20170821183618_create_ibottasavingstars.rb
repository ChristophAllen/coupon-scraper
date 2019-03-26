class CreateIbottasavingstars < ActiveRecord::Migration
  def change
    create_table :ibottasavingstars do |t|
        t.column :title, :string, :presence => true, :uniqueness => true

      t.timestamps null: false
    end
  end
end
