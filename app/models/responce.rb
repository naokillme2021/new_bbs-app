class Responce < ApplicationRecord
  # レスの文字数を140文字までに制限する
  validates :value, presence: true, length: { in: 1..140 }

  # 投稿者名の文字数を20文字までに制限する
  validates :name, presence: false, length: { in: 1..20 }

  # thredsテーブルへの紐付け(親)
  belongs_to :thred

  # thredsレコードに紐づくresponceレコードを全件取得する
  scope :res_in_threds, -> {
    includes(:thred)
  }

  # 引数のthred_idに紐づくレスを全て取得する(逆順)
  scope :responce_where, -> (param) {
    where(thred_id: param).order(child_id: :desc)
  }

  # 引数のthredに紐づくresponcesの件数を取得する
  scope :cnt_responce, -> (param) {
    where(thred_id: param).count
  }
end
