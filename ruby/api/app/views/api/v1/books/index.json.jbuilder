json.books @books, partial: 'books/show', as: :book
json.total_count @books.size
