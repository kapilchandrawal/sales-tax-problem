require_relative("print_receipt.rb")

EXEMPT = %w[chocolates, book, pills, chocolate]
PRODUCTS_ARR = []

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

  # Calculate the different taxes :-
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

no = 0
puts "Number of products?"
no = gets.chomp.to_i
while no > 0
  data = gets.chomp
  split_data = data.split
  qty = split_data[0].to_i
  price = split_data[-1].to_f
  p = data.split(" at ")
  product = p[0].delete("/0-9/").strip
  # puts product
  exempt = false
  imported = false
  if product.include?('imported')
    imported = true
  end
  # puts product && $EXEMPT
  chck_product = product.slice! "imported".strip
  product = product.strip
  EXEMPT.each do |px|
    if px.eql?(product)
      exempt = true
      # puts product
      break
    end
  end
  
  # puts imported, exempt
  products = Product.new(qty, product, price, exempt, imported, 0)  
  PRODUCTS_ARR.push(products)

  no-=1 
end

new_receipt = Receipt.new

PRODUCTS_ARR.each do |prod|
  new_receipt.add_to_receipt(prod)
end

puts new_receipt.print_list
