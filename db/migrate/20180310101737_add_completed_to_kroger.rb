class AddCompletedToKroger < ActiveRecord::Migration
  def change
    add_column :krogers, :completed, :boolean
  end
end
