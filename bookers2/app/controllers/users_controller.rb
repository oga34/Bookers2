class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
  end
  
  def new
    @book=Book.new
    @books=Book.all
  end
  
  def create
    book = book.new(book_params)
    book.save
    redirect_to books_path
  end
  
  def edit
  end

  def index
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end