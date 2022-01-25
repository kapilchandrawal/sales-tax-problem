require_relative("sales_tax.rb")
require_relative("print_receipt.rb")

PRODUCTS_ARR = []
EXEMPT = %w[chocolates book pills chocolate]

class Entry
  def input
    no = 0
    puts "Number of products?"
    no = gets.chomp.to_i
    while no > 0
      data = gets.chomp
      split_data = data.split
      qty = split_data[0].to_i
      price = split_data[-1].to_f
      p = data.split(" at ")
      product1 = p[0].delete("/0-9/")
      prd = product1.strip
      product = product1.strip
      exempt = false
      imported = false
      
      if price <= 0
        puts "Please enter valid value"
        break
      end
      if qty <= 0
        puts "Please enter valid value"
        break
      end
      if product.include?('imported')
        imported = true
      end
      chck_product = product.slice! "imported".strip
      product = product.strip
      EXEMPT.each do |px|
        if product.include?(px)
          exempt = true
          break
        end
        puts px
      end
      products = Product.new(qty, prd, price, exempt, imported, 0)
      PRODUCTS_ARR.push(products)
      products.calculate_tax
      no -= 1
    end
  end
  def print_rec
    new_receipt = Receipt.new
    PRODUCTS_ARR.each do |prod|
      new_receipt.add_to_receipt(prod)
    end
    new_receipt.print_list
  end
end
object = Entry.new
object.input
object.print_rec

