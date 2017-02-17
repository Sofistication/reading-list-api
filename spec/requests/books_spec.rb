# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :request do
  def book_params
    {
      title: '1984',
      author: 'George Orwell',
      published_in: 1949
    }
  end

  def book
    Book.first
  end

  before(:all) do
    Book.create!(book_params)
  end

  after(:all) do
    Book.delete_all
  end

  describe 'GET index' do
    before(:each) { get '/books' }

    it 'is succesful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      books_collection = JSON.parse(response.body)['books']
      expect(books_collection).not_to be_nil
      expect(books_collection.first['title']).to eq(book.title)
    end
  end

  describe 'GET show' do
    before(:each) { get "/books/#{book.id}" }
    it 'is successful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      book_response = JSON.parse(response.body)['book']
      expect(book_response).not_to be_nil
    end

    it 'has the correct content' do
      book_response = JSON.parse(response.body)['book']
      expect(book_response['id']).to eq(book.id)
      expect(book_response['title']).to eq(book.title)
    end
  end

  describe 'DELETE destroy' do
    # before(:each) { delete :destroy, id: book.id }
    it 'is successful and returns an empty response' do
      book_id = book.id
      delete "/books/#{book.id}"

      expect(response.status).to eq(204)

      expect(response.body).to be_empty

      expect { Book.find(book_id) }
        .to raise_error(ActiveRecord::RecordNotFound)
    end

    # it 'deletes the book' do
    #   expect(book).to be_nil
    # end
  end

  describe 'PATCH update' do
    def book_diff
      { title: 'Homage to Catalonia' }
    end

    before(:each) do
      patch :update, params: { id: book.id, book: book_diff },
                     format: :json
      # patch :update, id: book.id, book: book_diff
    end

    it 'is successful' do
      expect(response.status).to eq(204)
    end

    it 'returns an empty response' do
      expect(response.body).to be_empty
    end

    it 'updates an book' do
      expect(book[:title]).to eq(book_diff[:title])
    end
  end

  describe 'POST create' do
    def new_book
      { title: 'Animal Farm',
        author: 'George Orwell',
        published_in: 1945 }
    end

    before(:each) do
      post :create, params: { book: new_book }, format: :json
    end

    it 'is successful' do
      expect(response.status).to eq(201)
    end

    it 'renders a JSON response' do
      book_response = JSON.parse(response.body)

      expect(book_response['title']).to eq(new_book[:title])
      expect(book_response['id']).not_to be_nil
    end
  end
end
