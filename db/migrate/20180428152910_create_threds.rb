class CreateThreds < ActiveRecord::Migration[5.2]
  def change
    create_table :threds do |t|
      t.string :name
      t.string :title
      t.bigint :category_id
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
