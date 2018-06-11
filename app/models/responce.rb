class Responce < ApplicationRecord
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
