require_relative "products.rb"

class Books < Products
  attr_accessor :name,
                :genre,
                :author

  def self.from_file(path)
    params_array = File.readlines(path)

    {
      name:    params_array[0]
      genre:   params_array[1]
      author:  params_array[2]
      price:   params_array[3]
      num:     params_array[4]
    }
  end

  def initialize(params)
    super
    @name   = params[:name]
    @genre  = params[:genre]
    @author = params[:author]
  end

  def to_s
    "Книга \"#{@name}\", #{@genre}, автор - #{@author}, #{super}"
  end

  def update(params)
    @name   = params[:name]   if params[:name]
    @genre  = params[:genre]  if params[:genre]
    @author = params[:author] if params[:author]
  end
end
