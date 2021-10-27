require_relative "products.rb"

class Books < Products
  attr_reader :name, :genre, :author
  def initialize(params)
    super
    @name = params[:name]
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    puts "Книга \"#{@name}\", #{@genre}, автор - #{@author}, #{super}"
  end
end
