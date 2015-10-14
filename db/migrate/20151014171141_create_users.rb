class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :mail
      t.boolean :banned
      t.boolean :deleted

      t.timestamps null: false
    end
  end
end
