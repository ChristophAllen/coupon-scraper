class CreateTargetcoupons < ActiveRecord::Migration
  def change
    create_table :targetcoupons do |t|
      t.column :title, :string, :presence => true, :uniqueness => true
      t.column :value, :integer, :presence => true

      t.timestamps null: false
    end
  end
end
