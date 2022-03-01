require_relative "lib/film"
require_relative "lib/film_collection"

collection = FilmCollection.from_files("#{__dir__}/data/*.txt")

puts "Программа «Фильм на вечер» v1.0"

directors = collection.directors

directors.each.with_index(1) do |director, index|
  puts "#{index}. #{director}"
end

puts "Фильм какого режиссера вы хотите сегодня посмотреть?"
user_choice = gets.to_i

advice_films = collection.director_films(directors[user_choice - 1])

puts advice_films.sample
