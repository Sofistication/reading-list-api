# frozen_string_literal: true

class BooksController < ProtectedController
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    @books = if search_params
               Book.where(search_params).order(author: :asc)
             else
               Book.all.order(author: :asc)
             end

    render json: @books
  end

  # GET /lists
  def lists
    @books = current_user.readings.order(created_at: :asc)

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

  # commented out to meet requirements, uncomment for final version
  # # PATCH/PUT /books/1
  # def update
  #   if @book.update(book_params)
  #     head :no_content
  #   else
  #     render json: @book.errors, status: :unprocessable_entity
  #   end
  # end

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
