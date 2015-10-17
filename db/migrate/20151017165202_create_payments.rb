class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :month_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
