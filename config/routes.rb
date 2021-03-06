# frozen_string_literal: true
Rails.application.routes.draw do
  resources :readings, only: [:show, :update, :create, :destroy]
  get '/lists' => 'books#lists'
  resources :books, except: [:new, :edit, :update, :destroy]
  resources :examples, except: [:new, :edit]

  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
end
