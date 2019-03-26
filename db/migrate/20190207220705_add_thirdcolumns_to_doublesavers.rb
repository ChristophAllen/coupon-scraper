class AddThirdcolumnsToDoublesavers < ActiveRecord::Migration
  def change
    add_column :doublesavers, :title3, :string
    add_column :doublesavers, :value3, :string
    add_column :doublesavers, :link3, :string
    add_column :doublesavers, :store3, :string
    add_column :doublesavers, :triplesave, :boolean
  end
end
