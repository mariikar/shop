require_relative "products.rb"

class Films < Products
  attr_acessor :name,
               :year,
               :director

  def self.from_file(path)
    params_array = File.readlines(path)

    {
      name:     params_array[0]
      director: params_array[1]
      year:     params_array[2]
      price:    params_array[3]
      num:      params_array[4]
    }
  end

  def initialize(params)
    super
    @name     = params[:name]
    @year     = params[:year]
    @director = params[:director]
  end

  def to_s
    "Фильм \"#{@name}\", #{@year}, реж. #{@director}, #{super})"
  end

  def update(params)
    @name   = params[:name]   if params[:name]
    @genre  = params[:genre]  if params[:genre]
    @author = params[:author] if params[:author]
  end
end
