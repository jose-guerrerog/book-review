# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Only create if it doesn't exist already
unless User.exists?(email: 'admin@gmail.com')
  User.create!(email: 'admin@gmail.com', password: 'password')
end

# For categories or other reference data
['Biography', 'Fantasy', 'Technology'].each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

# # For more complex seeding with associations
# book = Book.find_or_create_by!(title: 'The Great Novel') do |b|
#   b.author = 'Famous Author'
#   b.description = 'A really interesting book'
#   b.category = Category.find_by(name: 'Fiction')
# end