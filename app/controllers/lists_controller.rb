class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
  # データを受け取り新規登録する
  list = List.new(list_params)
  # データベースに保存
  list.save
  # トップ画面へリダイレクト
  redirect_to list_path(list.id)
  end

  def edit
    # 編集機能
    @list = List.find(params[:id])
  end
  # 更新する
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def show
    # 詳細画面
    @list = List.find(params[:id])
  end

  def index
    # 一覧画面
    @lists = List.all
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body)
  end
end
