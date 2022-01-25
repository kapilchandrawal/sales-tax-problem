
class Product
  attr_accessor :qty, :item_name, :price, :exempt, :imported, :tax
  def initialize(qty, item_name, price, exempt, imported, tax)
    @qty = qty
    @item_name = item_name
    @price = price.to_f
    @exempt = exempt
    @imported = imported
    @tax = tax
  end
  def calculate_tax
    @tax = 0
    if @exempt == false && @imported == true
      @tax = @price * (0.05 + 0.10)
    elsif @exempt == false && @imported == false
      @tax = @price * 0.10
    elsif @exempt == true && @imported == true
      @tax = @price * 0.05
    elsif @exempt == true && @imported == false
      @tax = 0
    end
    @sales_tax = @tax
  end
end
