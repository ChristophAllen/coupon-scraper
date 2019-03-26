class AddTitle1ToKrogersavingstar < ActiveRecord::Migration
  def change
    add_column :krogersavingstars, :title1, :string
    add_column :krogersavingstars, :title2, :string
    add_column :krogersavingstars, :value1, :string
    add_column :krogersavingstars, :value2, :string
    add_column :krogersavingstars, :link1, :string
    add_column :krogersavingstars, :link2, :string
    add_column :krogersavingstars, :store1, :string
    add_column :krogersavingstars, :store2, :string
    add_column :krogersavingstars, :repeaters, :array
  end
end
