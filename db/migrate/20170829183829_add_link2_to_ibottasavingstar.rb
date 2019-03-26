class AddLink2ToIbottasavingstar < ActiveRecord::Migration
  def change
    add_column :ibottasavingstars, :link2, :string
  end
end
