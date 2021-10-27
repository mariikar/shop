require_relative "lib/products.rb"
require_relative "lib/books.rb"
require_relative "lib/films.rb"

products = []

products << Films.new(name: 'Леон', year: '1994', director: 'Люк Бессон', price: 990, num: 5)
products << Films.new(name: 'Леон', year: '1994', director: 'Люк Бессон', price: 990, num: 5)
products << Books.new(name: 'Идиот', genre: '1994', autor: 'Федор Достоевский', price: 990, num: 5)

puts 'Вот какие товары у нас есть:'
puts
products.each { |product| puts product}
