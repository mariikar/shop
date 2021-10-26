class Products
  attr_reader :price, :num
  def initialize(params)
    @price = params[:price]
    @num = params[:num]
  end
end
