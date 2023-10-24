class BooksController < ApplicationController
  def new
      #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
      @book = Book.new
  end

  def create
    #データを受け取り新規登録のインスタンス作成
    #paramsにはformから送られてくるデータが入っている
    book = Book.new(list_params)
    #データをデータベースに保存するためのsaveメソッド実行
    book.save
    #topへリダイレクト
    redirect_to list_pat(list.id)
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(list_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id]) #データ(レコード)を１件取得
    book.destroy #データ(レコード)を削除
    redirect_to '/books'  #投稿一覧画面へリダイレクト
  end
  #これより下はcontroller内のみ呼び出す
  private
  #ストロングデータ
  def list_params
    params.require(:book).permit(:title, :body)
  end
end
