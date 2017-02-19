# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :request do
  def user_params
    {
      email: 'alice@example.com',
      password: 'foobarbaz',
      password_confirmation: 'foobarbaz'
    }
  end

  def user_auth
    post '/sign-up', params: { credentials: user_params }
    post '/sign-in', params: { credentials: user_params }
    JSON.parse(response.body)['user']
  end

  def headers
    {
      'HTTP_AUTHORIZATION' => "Token token=#{user_auth['token']}"
    }
  end

  def book_params
    {
      title: '1984',
      author: 'George Orwell',
      published_in: 1949,
      user: User.find(user_auth['id'])
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
    User.delete_all
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
    before(:each) { get "/books/#{book.id}", headers: headers }
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

  describe 'GET list' do
    before(:each) { get '/list', headers: headers }
    it 'is succesful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      book_response = JSON.parse(response.body)['books']
      expect(book_response).not_to be_nil
    end
  end

  describe 'DELETE destroy' do
    # before(:each) { delete :destroy, id: book.id }
    it 'is successful and returns an empty response' do
      book_id = book.id
      delete "/books/#{book.id}", headers: headers

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
      patch "/books/#{book.id}", params: { book: book_diff }, headers: headers
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
      puts new_book
      post '/books', params: { book: new_book }, headers: headers
    end

    it 'is successful' do
      expect(response.status).to eq(201)
    end

    it 'renders a JSON response' do
      book_response = JSON.parse(response.body)['book']

      expect(book_response['title']).to eq(new_book[:title])
      expect(book_response['id']).not_to be_nil
    end
  end
end
