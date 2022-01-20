require_relative("print_receipt.rb")
# require "pry"
# require 'csv'

# $product_list = {}
class Product

  attr_accessor :qty, :item_name, :price, :exempt, :imported, :tax
  def initialize(qty, item_name, price, exempt, imported)
    @qty = qty
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

puts "Enter quantity of product: "
x = 3
while x >= 1
  data = gets.chomp
  # puts "Enter item name: "
  # item_name = gets.chomp
  # puts "Enter item price: "
  # price = gets.chomp
  # puts "Enter exempt in true or false: "
  # exempt = gets.chomp
  # puts "Enter if item is imported in true or false: "
  # imported = gets.chomp
  # puts qty , " " , item_name , " " , "at" , " " , price.class
  qty, item_name, at_no, price = data.split(/ /)
  # puts data
  # item_lists = [].push(qty, item_name, at_no, price)
  # puts item_lists
  puts qty + " " + item_name + " " + at_no + " " + price
  x -= 1
  # puts "Would you like to add another product?"
  # response = gets.chomp
end
if data.downcase == "imported"
# if response.downcase == "no"
  product = Product.new(qty.to_i, item_name, price, exempt==false, imported==true)
  # $product_list.push(product)
  new_receipt = Receipt.new
  new_receipt.add_to_receipt(product)
# else
  # puts "Enter quantity of product: "
  # data = gets.chomp
end
# csv_dta = CSV.read("csv_file.csv")
# csv = CSV.parse(csv_dta, :headers => true)
# csv.each do |a|
#   binding.pry
# end
# puts $product_list
# CSV.foreach("csv_file.csv", headers: true, col_sep: ",") do |column|
#   # binding.pry
#   # puts column
#   puts $product_list
#   $product_list.push(column)

# end

# end
# book = Product.new(qty.to_i, item_name, price, exempt, imported)
# cd = Product.new(2, "Internals", 14.99, false, false)
# chocolate = Product.new(1, "Chocolate", 0.85, true, false)

# new_receipt = Receipt.new
# new_receipt.add_to_receipt(book)
# new_receipt.add_to_receipt(cd)
# new_receipt.add_to_receipt(chocolate)

puts new_receipt.print_list
