class Product

  def initialize(item_name, price, exempt, imported)
    @item_name = item_name
    @price = price.to_f
    @exempt = exempt
    @imported = imported
    @tax = 0
  end

  # Calculate the different taxes :-
  def calculate_tax
    if @exempt == false && @imported == true
      @tax = @price * 0.5
    elsif @exempt == false && @imported == false
      @tax = @price * 0.10
    elsif @exempt == true && @imported == false
      @tax = 0
    end
  end
end

# Create Objects that will be products:-
book = Product.new("Thor", 13.99, true, false)