class CreateKrogersavingstars < ActiveRecord::Migration
  def change
    create_table :krogersavingstars do |t|

      t.timestamps null: false
    end
  end
end
