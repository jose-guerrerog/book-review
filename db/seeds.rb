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
[ 'Biography', 'Fantasy', 'Technology' ].each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

# # For more complex seeding with associations
# book = Book.find_or_create_by!(title: 'The Great Novel') do |b|
#   b.author = 'Famous Author'
#   b.description = 'A really interesting book'
#   b.category = Category.find_by(name: 'Fiction')
# end

# Helper method to open files
def open_file(file_name)
  File.open(Rails.root.join("lib", "assets", "seed_images", file_name))
end

# Example: Seeding books with cover images
book1 = Book.find_or_create_by!(title: "Steve Jobs: The Exclusive Biography") do |book|
  book.title = "Steve Jobs: The Exclusive Biography"
  book.author = "Walter Isaacson"
  book.description = "A fascinating story about adventure and discovery."
  # Other book attributes...
  book.author = "admin@gmail.com"
end

# Attach an image to the book
book1.avatar.attach(
  io: open_file("stevejobs.jpg"),
  filename: "stevejobs.jpg",
  content_type: "image/jpeg"
)

# Example: Seeding books with cover images
book2 = Book.find_or_create_by!(title: "The Chronicles of Narnia") do |book|
  book.title = "The Chronicles of Narnia"
  book.author = "C.S. Lewis"
  book.description = "A fascinating story about adventure and discovery."
  book.author = "admin@gmail.com"
  # Other book attributes...
end

# Attach an image to the book
book2.avatar.attach(
  io: open_file("narnia.jpg"),
  filename: "narnia.jpg",
  content_type: "image/jpeg"
)
