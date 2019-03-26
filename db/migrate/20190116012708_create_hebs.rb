class CreateHebs < ActiveRecord::Migration
  def change
    create_table :hebs do |t|

      t.timestamps null: false
    end
  end
end
