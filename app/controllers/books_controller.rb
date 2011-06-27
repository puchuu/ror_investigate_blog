class BooksController < ApplicationController
	# GET /books
  def index
    @books = Book.all
  end

	# GET /books/1
  def show
    @book = Book.find(params[:id])
  end

	# GET /books/new
  def new
    @book = Book.new
  end

	# GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

	# POST /books
  def create
    @book = Book.new(params[:book])

		if @book.save
			redirect_to :books, :notice =>"Book was successfully created."
		else
			render :action => "new"
		end
  end

	# PUT /books/1
  def update
    @book = Book.find(params[:id])

		if @book.update_attributes(params[:book])
			redirect_to :books, :notice => "Book was successfully updated."
		else
			render :action => "edit"
		end
  end

  # DELETE /books/1
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_url
  end
end
