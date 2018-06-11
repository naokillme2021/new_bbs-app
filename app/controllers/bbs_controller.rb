# encoding: utf-8
# BBSコントローラークラス
class BbsController < ApplicationController
  # showメソッド
  def show
    # 必要データの読み込み
    @thred = Thred.thred_all
    @res = Responce.res_in_threds
  end

  # show_bbsメソッド
  def show_bbs
    # 必要データの読み込み
    @thred = Thred.thred_where(params[:id])
    @res = Responce.responce_where(params[:id])
    @res_child = ResponceChild.responce_child_where(params[:id])
  end

  # pot_responceメソッド
  def post_responce
    if params[:responce][:value].present?
      # responcesテーブルへ書き込み
      @responce = Responce.new
      @responce.thred_id = params[:responce][:thred_id]
      @responce.child_id = generate_child_id(params[:responce][:thred_id])
      @responce.name = generate_name(params[:responce][:name])
      @responce.value = params[:responce][:value]
      @responce.date = Date.today
      @responce.time = Time.now
      @responce.save
    end

    # リダイレクト
    redirect_to :action => 'show_bbs', :id => params[:responce][:thred_id]
  end

  # post_res_childメソッド
  def post_res_child
    if params[:responce_child][:value].present?
      # responcesテーブルへ書き込み
      @responce_child = ResponceChild.new
      @responce_child.thred_id = params[:responce_child][:thred_id]
      @responce_child.child_id = params[:responce_child][:child_id]
      @responce_child.name = generate_name(params[:responce_child][:name])
      @responce_child.value = params[:responce_child][:value]
      @responce_child.date = Date.today
      @responce_child.time = Time.now
      @responce_child.save
    end
  
    # リダイレクト
    redirect_to :action => 'show_bbs', :id => params[:responce_child][:thred_id]
  end

  private
  # child_id生成用メソッド
  def generate_child_id(thred_id)
    cnt_responce = Responce.cnt_responce(thred_id)

    # responceの総件数をインクリメントしてIDを生成
    return cnt_responce += 1
  end

  # 名前生成用メソッド
  def generate_name(name)
    # nameが空だった場合は「名無しさん」を設定
    if name.present?
      return name
    else
      return '名無しさん'
    end
  end
end
