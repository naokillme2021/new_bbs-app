class PostThredsController < ApplicationController

  # Post_thred画面のControllerメソッド
  def post
    # 必要データの読み込み
    @category = Category.select("categories.*")
  end

  # スレッド投稿のメソッド
  def post_thred
      # thredsテーブルへ書き込み
      @thred = Thred.new
      @thred.name = params[:thred][:name]
      @thred.title = params[:thred][:title]
      @thred.category_id = params[:thred][:category_id]
      @thred.date = Date.today
      @thred.time = Time.now
      
      if @thred.save
        # Saveが成功したら、ひとつ前のページへリダイレクト
        redirect_to controller: 'bbs', action: 'show'
      else
        # Saveに失敗したら、同じページにリダイレクト
        redirect_to controller: 'post_threds', action: 'post'
      end
  end
end
