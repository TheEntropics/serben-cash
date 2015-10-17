class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :text
      t.string :importance
      t.datetime :elapseDate

      t.timestamps null: false
    end
  end
end
