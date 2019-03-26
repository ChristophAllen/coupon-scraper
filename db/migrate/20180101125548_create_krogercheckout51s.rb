class CreateKrogercheckout51s < ActiveRecord::Migration
  def change
    create_table :krogercheckout51s do |t|

      t.timestamps null: false
    end
  end
end
