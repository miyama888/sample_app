class TodolistsController < ApplicationController
  def new
  	#Viewへ渡すためのインスタンス変数にからのモデルオブジェクトを生成する
  	@list = List.new
  end

  #以下を追加
  def create
  	# 1.データを新規登録するためのインスタンス作成
  	list =List.new(list_params)
  	# 2.データをデータベースに保存するためのsaveメソッド実行
  	list.save
  	# 3.トップ画面へリダイレクト
  	redirect_to '/top'
  end

  def index
  	@lists = List.all
  end

  def show
  	@list = List.find(params[:id])
  end

  def create
  	list = List.new(list_params)
  	list.save # データベースへ保存する
  	redirect_to todolist_path(list.id) # 詳細画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def list_params
  	params.require(:list).permit(:title, :body)
  end
end
