require_relative "lib/products"
require_relative "lib/films"
require_relative "lib/books"

film_leon = Film.new(price: 260, num: 5)

puts "Фильм Леон стоит #{film_leon.price} руб."
