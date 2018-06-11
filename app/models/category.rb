class Category < ApplicationRecord
  # thredsテーブルへの紐付け(子)
  has_many :threds

  # categoriesの作成/更新/削除とともに、thredsの作成/更新/削除も可能にする
  accepts_nested_attributes_for :threds, allow_destroy: true
end
