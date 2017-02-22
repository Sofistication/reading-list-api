# frozen_string_literal: true

class BooksController < ProtectedController
  before_action :set_book, only: [:show, :update, :destroy]
  has_scope :by_title
  has_scope :by_author

  # GET /books
  def index
    if search_params
      @books = Book.where(search_params)
    else
      @books = Book.all
    end

    render json: @books
  end

  # GET /lists
  def lists
    @books = current_user.readings

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Books.new(book_params)

    if @book.save
      render json: @book, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      head :no_content
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy

    head :no_content
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end
  private :set_book

  # Only allow a trusted parameter "white list" through.
  def book_params
    params.require(:book)
          .permit(:title, :author, :published_in, :description)
  end
  private :book_params

  def search_params
    params.permit(:title, :author)
  end
  private :search_params
end
