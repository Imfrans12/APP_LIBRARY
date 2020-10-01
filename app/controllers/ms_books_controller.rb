class MsBooksController < ApplicationController
  def index
      @ms_books = MsBook.where(is_active: true) 
  end

   def show
    @ms_book = MsBook.find(params[:id])
  end

  def new
    @ms_book = MsBook.new
  end

  def create
    @ms_book = MsBook.new(ms_books_params)

    if @ms_book.save
      redirect_to ms_books_path, notice: "Data Successfuly Created"
    else
      render 'new'
    end

  end

  def edit
    @ms_books = MsBook.find(params[:id])
  end

  def update
    @ms_books = MsBook.find(params[:id])

    if @ms_books.update(ms_books_params)
      redirect_to ms_books_path, notice: "Data Successfuly Edited"
    else
      render 'edit'
    end

  end

  def destroy
    @ms_books = MsBook.find(params[:id])
    @ms_books.update_attributes(:is_active => false)
    redirect_to ms_books_path, notice: "Data Successfuly Deleted"
  end

  

  private
  def ms_books_params
    params.require(:ms_book).permit(:id, :name, :ms_publisher_id)
  end
end
