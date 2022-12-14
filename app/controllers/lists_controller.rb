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
  redirect_to '/top'
  end

  def edit
  end

  def show
  end

  def index
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body)
  end
end
