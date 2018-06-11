class Thred < ApplicationRecord
  # タイトル文字数を50文字までに制限する
  validates :title, presence: true, length: { in: 1..50 }

  # responcesテーブルへの紐付け(子)
  has_many :responces

  # categoriesテーブルへの紐付け(親)
  belongs_to :category

  # thredsテーブルとcategoriesテーブルを外部結合して両テーブルのカラム全件取得する(逆順)
  scope :thred_all, -> {
    includes(:category).order(id: :desc)
  }

  # 引数のthred_idに紐づくthredレコードを取得する
  scope :thred_where, -> (param) {
    where(id: param) 
  }
end
