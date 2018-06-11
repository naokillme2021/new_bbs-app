class PostThredsController < ApplicationController
  # Post_thred画面のControllerメソッド
  def post
    # 必要データの読み込み
    @category = Category.select("categories.*")
  end

  # スレッド投稿のメソッド
  def post_thred
    if params[:thred][:title].present?
      # thredsテーブルへ書き込み
      @thred = Thred.new
      @thred.name = params[:thred][:name]
      @thred.title = params[:thred][:title]
      @thred.category_id = params[:thred][:category_id]
      @thred.date = Date.today
      @thred.time = Time.now
      @thred.save

      # ひとつ前のページへリダイレクト
      redirect_to controller: 'bbs', action: 'show'
    end
  end
end
