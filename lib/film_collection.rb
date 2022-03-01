class FilmCollection
  attr_reader :films
  
  def self.from_list
  
  end
  
  def self.from_files(cinema_paths)
    films =
      Dir[cinema_paths].map do |film|
        lines = File.readlines(film, chomp: true)
        title = lines[0]
        director = lines[1]
        year = lines[2]
        Film.new(
          title: title,
          director: director,
          year: year
        )
      end
    new(films)
  end

  def initialize(films)
    @films = films
  end


  def directors
    @films.map { |film| film.director }.uniq.sort
  end

  def director_films(director)
    @films.select { |film| film.director == director }
  end
end
