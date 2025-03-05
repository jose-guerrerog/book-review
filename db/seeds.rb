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

books_data = [
  {
    title: "Steve Jobs: The Exclusive Biography",
    author: "Walter Isaacson",
    description: "The exclusive biography of Steve Jobs, based on more than forty interviews with Jobs conducted over two years—as well as interviews with more than a hundred family members, friends, adversaries, competitors, and colleagues.",
    category_id: Category.find_by(name: "Biography").id,
    cover_image: "stevejobs.jpg"
  },
  {
    title: "The Chronicles of Narnia",
    author: "C.S. Lewis",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    category_id: Category.find_by(name: "Fantasy").id,
    cover_image: "narnia.jpg",
    user_id: 1,
  },
  {
    title: "Harry Potter and the Philosopher's Stone",
    author: "J.K. Rowling",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    category_id: Category.find_by(name: "Fantasy").id,
    cover_image: "hp1.jpg",
    user_id: 1,
  },
  {
    title: "Aerial Robotics: With STM32F100RB Microcontroller",
    author: "Sheikh Muhammad Ibraheem",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    category_id: Category.find_by(name: "Technology").id,
    cover_image: "aerial.jpg",
    user_id: 1,
  },
  {
    title: "Elon Musk: A Biography of an Entrepreneur and Innovator",
    author: "Ross Danvers",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    category_id: Category.find_by(name: "Biography").id,
    cover_image: "elon_musk.jpg",
    user_id: 1,
  },
]

# # Create books and attach cover images
# books_data.each do |book_data|
#   book = Book.find_or_create_by!(title: book_data[:title]) do |b|
#     b.author = book_data[:author]
#     b.description = book_data[:description]
#     b.category_id = book_data[:category_id]
#     b.user_id = user.id
#   end

#   # Only attach image if the book doesn't already have one
#   unless book.avatar.attached?
#     begin
#       book.avatar.attach(
#         io: open_file(book_data[:cover_image]),
#         filename: book_data[:cover_image],
#         content_type: "image/jpeg"
#       )
#       puts "Attached cover image to: #{book.title}"
#     rescue Errno::ENOENT => e
#       puts "Warning: Could not find image file #{book_data[:cover_image]} for book '#{book.title}'. Error: #{e.message}"
#     end
#   end
# end
