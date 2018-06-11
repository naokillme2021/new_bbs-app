class ResponceChild < ApplicationRecord
  # レスの文字数を140文字までに制限する
  validates :value, presence: true, length: { in: 1..140 }

  # 投稿者名の文字数を20文字までに制限する
  validates :name, presence: false, length: { in: 1..20 }

  # 引数のthred_idに紐づくres_childを全て取得する
  scope :responce_child_where, -> (param) {
    ResponceChild.where(thred_id: param)
  }
end
