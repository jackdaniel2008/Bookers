class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    # ｢view｣ファイルへの受け渡しが必要ないためローカル変数
    book = Book.new(book_params)
    book.save
    # ｢/bboks｣画面へリダイレクト
    redirect_to "/books/#{book.id}"
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
