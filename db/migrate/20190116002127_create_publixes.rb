class CreatePublixes < ActiveRecord::Migration
  def change
    create_table :publixes do |t|

      t.timestamps null: false
    end
  end
end
