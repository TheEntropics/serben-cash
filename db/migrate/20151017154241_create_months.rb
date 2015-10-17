class CreateMonths < ActiveRecord::Migration
  def change
    create_table :months do |t|
      t.string :name
      t.date :firstDay

      t.timestamps null: false
    end
  end
end
