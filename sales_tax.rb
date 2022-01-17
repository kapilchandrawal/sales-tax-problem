require_relative("print_receipt.rb")

class Product

  attr_accessor :item_name, :price, :exempt, :imported, :tax

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
<<<<<<< HEAD

# Create Objects that will be products:-
book = Product.new("Thor", 12.49, true, false)
cd = Product.new("Internals", 14.99, false, false)
chocolate = Product.new("Chocolate", 0.85, true, false)


new_receipt = Receipt.new
new_receipt.add_to_receipt(book)
new_receipt.add_to_receipt(cd)
new_receipt.add_to_receipt(chocolate)

puts new_receipt.print_list
=======
>>>>>>> 0992bbc34e4d260e0fe654fc144a67478b5bff8b
