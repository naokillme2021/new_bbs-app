class CreateResponces < ActiveRecord::Migration[5.2]
  def change
    create_table :responces do |t|
      t.bigint :thred_id
      t.bigint :parent_id
      t.bigint :child_id
      t.string :name
      t.string :value
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
