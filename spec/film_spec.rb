require 'film'

describe Film do
  let(:film) do
    Film.new(title: 'Макросс Плюс', director: 'Сёдзи Кавамори', year: 1994)
  end

  describe '#initialize' do
    it 'assigns instance variables' do
      expect(film.title).to eq 'Макросс Плюс'
      expect(film.director).to eq 'Сёдзи Кавамори'
      expect(film.year).to eq 1994
    end
  end

  describe '#to_s' do
    it 'correctly film inforation displaing' do
      expect(film.to_s).to eq "Сёдзи Кавамори -- Макросс Плюс (1994)"
    end
  end
end
