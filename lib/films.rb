require_relative "products.rb"

class Films < Products
  attr_reader :name, :year, :director
  def initialize(params)
    super
    @name = params[:name]
    @year = params[:year]
    @director = params[:director]
  end

  def to_s
    puts "Фильм \"#{@name}\", #{@year}, реж. #{@director}, #{super}"
  end
end
