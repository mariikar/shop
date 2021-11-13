require_relative "lib/books.rb"
require_relative "lib/films.rb"

products = []

film = Films.new(name: 'Леон', director: 'Люк Бессон', price: 990)
film.year = 1994
film.update(num: 5)

book = Books.new(name: 'Идиот', genre: 'роман', numt: 10)
book.author = 'Федька Достоевский'
book.price = 1500
book.update(author: 'Фёдор Достоевский', price: 1500)

p film = Films.from_file('/data/films/01.txt')

puts film
puts
puts book
