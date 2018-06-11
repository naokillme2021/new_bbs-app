class ResponceChild < ApplicationRecord
  # 引数のthred_idに紐づくres_childを全て取得する
  scope :responce_child_where, -> (param) {
    ResponceChild.where(thred_id: param)
  }
end
