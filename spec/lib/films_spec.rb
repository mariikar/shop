require_relative "../rspec_helper"

RSpec.describe Films do
  let(:film) { describe_class.new(params) }
  let(:params) do
    {
      name: 'Леон',
      year: '1994',
      director: 'Люк Бессон',
      price: '990',
      num: '5'
    }
  end

  describe 'Film.from_file' do
    subject(:method_call) { describe_class.from_file(path) }

    context 'when file present' do
      let(:path) { './spec/fixtures/films.txt'}
      it 'creates instance of Film from file' do
        expect(method_call).to eq params
      end
    end

    context 'when file is not present' do
      let(:path) { './spec/fixtures/films.txt'}
      it 'creates instance of Film from file' do
        expect(method_call).to raise_error NoFileError
      end
    end
  end

  describe 'Film#new' do
    context 'when correct params passed' do
      it 'creates instance of Film' do
        params.keys do |key|
          expect(film.send(:key)).to eq params[key]
        end
      end
    end
  end

  describe 'Film#to_s' do
    subject(:method_call) { film.to_s }
    let(:string) {"Фильм 'Леон', 1994, реж. Люк Бессон, 990 руб. (осталось 5)"}
      expect(method_call).to eq string
    end
  end

  describe 'Film#update' do
    subject(:method_call) { book.update(update_params) }

    context 'when all params passed' do
      let(:update_params) do
        {
          name: 'Кира',
          year: '2010',
          director: 'Петя',
          price: '500',
          num: '7'
        }
      end

      it 'update instance of Film' do
         expect { method_call }.to change(film, :name).from('Леон').to('Кира')
                                                      .and change(film, :year).from('1994').to('2010')
                                                      .and change(film, :director).from('Люк Бессон').to('Петя')
                                                      .and change(film, :price).from('990').to('500')
                                                      .and change(film, :num).from('5').to('7')
      end
    end

    context 'when some params passed' do
      let(:update_params) do
        {
          price: '600',
          num: '1'
        }
      end

      it 'updates exact attributes of Film' do
        expect { method_call }.to_change(film, :price).from('990').to('600')
                                                      .and change(film, :price).from('990').to('600')
                                                      .and change(film, :num).from('5').to('1')
      end

      it 'doesent update another attributes of Film' do
        expect { method_call }.to_not change(film, :name).from('Леон')
        expect { method_call }.to_not change(film, :year).from('1994')
        expect { method_call }.to_not change(film, :director).from('Люк Бессон')
      end
    end
  end
