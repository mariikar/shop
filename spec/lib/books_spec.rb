# require_relative "../rspec_helper"
#
# RSpec.describe Books do
#   let(:book) {described_class.new(params) }
#   let(:params) do
#     {
#       name: 'Идиот',
#       genre: 'роман',
#       author: 'Федька Достоевский',
#       price: '1500',
#       num: '5'
#     }
#   end
# end
#
#   describe 'Book.from_file' do
#     subject(:method_call) {described_class.from_file(path)}
#
#     context 'when file present' do
#       let(:path) { './spec/fixtures/book.txt'}
#       it 'creates instance of Book from file' do
#         expect(mathod_call).to eq params
#       end
#     end
#
#     context 'when file is not present' do
#       let(:path) { '../fixtures/garbage.txt'}
#       it 'doesnt creates instance of Book from file' do
#         expect{mathod_call}.to raise_error NoFileError
#       end
#     end
#
#     describe 'Book#new' do
#       context 'when correct params passed' do
#         it 'creates instance of Book' do
#           params.keys do |key|
#             expect(book.send(:key)).to eq params[key]
#           end
#         end
#       end
#     end
#
#     describe 'Book#to_s' do
#       subject(:method_call) { book.to_s }
#       let(:string) { "Книга 'Идиот', роман, автор - Федька Достоевский, 1500 руб. (осталось 5)" }
#       it 'stringify instance of Book' do
#         expect(method_call).to eq string
#       end
#     end
#
#     describe 'Book#update' do
#       subject(:method_call) { book.update(update_params) }
#
#       context 'when all params passed' do
#         let(:update_params) do
#           {
#             name: 'Коралл',
#             ganre: 'эпос',
#             author: 'Иван',
#             price: '3000',
#             num: '1'
#           }
#         end
#
#         it 'updates instance of Book' do
#            expect { method_call }.to change(book, :name).from('Идиот').to('Коралл')
#                                                         .and change(book, :genre).from('роман').to('эпос')
#                                                         .and change(book, :author).from('Федька Достоевский').to('Иван')
#                                                         .and change(book, :price).from('1500').to('3000')
#                                                         .and change(book, :num).from('5').to('1')
#         end
#       end
#
#       context 'when some params passed' do
#         let(:update_params) do
#           {
#             price: '2000',
#             num: '3'
#           }
#         end
#
#         it 'updates exat attributes of Book' do
#           expect { method_call }.to change(book, :price).from('1500').to('2000')
#                                                         .and change(book, :price).from('5').to('3')
#         end
#
#         it 'doesnt update another attributes of Book' do
#           expect { method_call }.to_not change(book, :name),from('Идиот')
#           expect { method_call }.to_not change(book, :genre),from('роман')
#           expect { method_call }.to_not change(book, :author),from('Федька Достоевский')
#         end
#       end
#     end
#   end

require_relative '../rspec_helper'

RSpec.describe Books do
  let(:book) { described_class.new(params) }
  let(:params) do
    {
      name: 'Идиот',
      genre: 'роман',
      author: 'Федька Достоевский',
      price: '1500',
      num: '5'
    }
  end

  describe 'Book.from_file' do
    subject(:method_call) { described_class.from_file(path) }

    context 'when file present' do
      let(:path) { './spec/fixtures/book.txt' }
      it 'creates instance of Book from file' do
        expect(method_call).to eq params
      end
    end

    context 'when file is not present' do
      let(:path) { '../fixtures/garbage.txt' }
      it 'doesnt create instance of Book from file' do
        expect { method_call }.to raise_error NoFileError
      end
    end
  end

  describe 'Book#new' do
    context 'when correct params passed' do
      it 'creates instance of Book' do
        params.keys do |key|
          expect(book.send(:key)).to eq params[key]
        end
      end
    end
  end

  describe 'Book#to_s' do
    subject(:method_call) { book.to_s }
    let(:string) { "Книга 'Идиот', роман, автор - Федька Достоевский, 1500 руб. (осталось 5)" }
    it 'stringify instance of Book' do
      expect(method_call).to eq string
    end
  end

  describe 'Book#update' do
    subject(:method_call) { book.update(update_params) }

    context 'when all params passed' do
      let(:update_params) do
        {
          name: 'Коралл',
          genre: 'эпос',
          author: 'Иван',
          price: '3000',
          num: '1'
        }
      end

      it 'updates instance of Book' do
        expect { method_call }.to change(book, :name).from('Идиот').to('Коралл')
                                                     .and change(book, :genre).from('роман').to('эпос')
                                                     .and change(book, :author).from('Федька Достоевский').to('Иван')
                                                     .and change(book, :price).from('

                                                       ').to('3000')
                                                     .and change(book, :num).from('5').to('1')
      end
    end

    context 'when some params passed' do
      let(:update_params) do
        {
          price: '2000',
          num: '3'
        }
      end

      it 'updates exact attributes of Book' do
        expect { method_call }.to change(book, :price).from('1500').to('2000')
                                                      .and change(book, :num).from('5').to('3')
      end

      it 'doesnt update another attributes of Book' do
        expect { method_call }.to_not change(book, :name).from('Идиот')
        expect { method_call }.to_not change(book, :genre).from('роман')
        expect { method_call }.to_not change(book, :author).from('Федька Достоевский')
      end
    end
  end
end
