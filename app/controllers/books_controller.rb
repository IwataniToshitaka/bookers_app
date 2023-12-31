class BooksController < ApplicationController
  def new
      #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
      @book = Book.new
  end

  def create
    #データを受け取り新規登録のインスタンス作成
    #paramsにはformから送られてくるデータが入っている
    @book = Book.new(book_params)
    #データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      flash[:notice] = "successfully!!!!!"
      book_id = @book.id
      redirect_to book_path(@book.id)  #showへリダイレクト
    else
      @books = Book.all
      render :"index"
    end
end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    # puts params[:id]
  end

  def edit
    @book = Book.find(params[:id])
    puts params[:id]
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully!!!!"
    book_id = @book.id
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :"index"
    end
  end

  def destroy
    book = Book.find(params[:id]) #データ(レコード)を１件取得

    if  book.destroy #データ(レコード)を削除
        redirect_to '/books'#投稿一覧画面へリダイレクト
        flash[:notice] = "successfully!!!!!!(ﾟ∀ﾟ)"
    else
      @books = Book.all
      render :"index"
    end
  end

  #これより下はcontroller内のみ呼び出す
  private
  #ストロングデータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end