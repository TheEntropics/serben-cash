class RemoveNameFromMonth < ActiveRecord::Migration
  def change
    remove_column :months, :name
  end
end
