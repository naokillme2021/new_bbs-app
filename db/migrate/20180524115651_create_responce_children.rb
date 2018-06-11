class CreateResponceChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :responce_children do |t|
      t.bigint :thred_id
      t.bigint :child_id
      t.string :name
      t.string :value
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
