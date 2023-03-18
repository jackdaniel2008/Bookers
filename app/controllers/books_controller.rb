class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    # ｢view｣ファイルへの受け渡しが必要ないためローカル変数
    # バリデーションチェックするためにインスタンス変数に変更
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      # ｢/books｣画面へリダイレクト
      redirect_to "/books/#{@book.id}"
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to "/books/#{book.id}"
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
