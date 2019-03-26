class AddCopiesToKrogersavingstar < ActiveRecord::Migration
  def change
    add_column :krogersavingstars, :copies, :integer
  end
end
