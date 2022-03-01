require 'film_collection'
require 'film'

describe FilmCollection do
  let(:films) do
    [
      Film.new(title: 'Весна, лето, осень, зима... и снова весна', director: 'Ким Ки Дук', year: 2003),
      Film.new(title: 'Макросс Плюс', director: 'Сёдзи Кавамори', year: 1994),
      Film.new(title: 'Мертвец', director: 'Джим Джармуш', year: 1995),
      Film.new(title: 'Ночь на Земле', director: 'Джим Джармуш', year: 1991)
    ]
  end

  let(:collection) { described_class.new(films) }

  let(:filmcollection_from_files) do
    FilmCollection.from_files('spec/fixtures/*.txt')
  end

  describe '::from_files' do
    it 'should return instance of FilmCollection' do
      expect(filmcollection_from_files).to be_a FilmCollection
    end

    it 'should read all .txt files' do
      expect(filmcollection_from_files.films.size).to eq 23
    end

    it 'FilmCollection should raed all files as Film objects examples ' do
      expect(filmcollection_from_files.films).to all be_a Film
    end
  end

  describe '::new' do
    it 'check instance variables of films in collection' do
      expect(collection.films).to eq films
    end
  end

  describe '.directors' do
    it 'check instance variables of films in collection' do
      expect(films.map(&:director).uniq).to match_array ['Ким Ки Дук', 'Сёдзи Кавамори', 'Джим Джармуш']
    end
  end

  describe 'director_films' do
    it 'return array with all Film(s) by director from collection' do
      expect(collection.director_films('Джим Джармуш').size).to eq 2
    end
  end
end
