class CreateMeijers < ActiveRecord::Migration
  def change
    create_table :meijers do |t|
      t.string :title
      t.string :string
      t.string :value
      t.string :string
      t.string :link
      t.string :string
      t.string :repeaters
      t.string :array
      t.string :store
      t.string :string

      t.timestamps null: false
    end
  end
end
