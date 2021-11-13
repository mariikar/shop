class Products
  attr_accessor :price,
                :num

  def self.from_file(_path)
    raise NotImplementedError
  end

  def initialize(params)
    @price     = params[:price]
    @num       = params[:num]
  end

  def to_s
    "#{@price} руб. (осталось #{@num}"
  end

  def update(params)
    @price     = params[:price]     if params[:price]
    @num       = params[:num]       if params[:num]
  end
end
