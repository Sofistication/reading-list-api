# frozen_string_literal: true
# This file should contain all the record creation needed to experiment with
# your app during development.
#
# The data can then be loaded with the rake db:examples (or created alongside
# the db with db:nuke_pave).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# %w(antony jeff matt jason).each do |name|
#   email = "#{name}@#{name}.com"
#   next if User.exists? email: email
#   User.create!(email: email,
#                password: 'abc123',
#                password_confirmation: nil)
# end

# example user for basic development
user_params = {
  email: 'test@book.next',
  password: 'test',
  password_confirmation: 'test'
}
User.create!(user_params)

%w(BookOne BookTwo BookThree BookFour BookFive BookSix BookSeven).each do |book|
  Book.create!(title: book,
               author: 'Maynard Ingram',
               published_in: 2017,
               user: User.find_by(email: 'test@book.next'))
end
