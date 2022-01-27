require_relative("sales_tax.rb")
require_relative("print_receipt.rb")

class Entry
  @@products_arr = []
  @@exe = %w[chocolates book pills chocolate]
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
      # prd = product1.strip
      product = product1.strip
      puts product
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
      product.include?('imported') ? imported = true : imported
      @@exe.each do |px|
        if product.include?(px)
          exempt = true
          break
        end
      end
      products = Product.new(qty, product, price, exempt, imported, 0)
      @@products_arr.push(products)
      products.calculate_tax
      no -= 1
    end
  end
  def print_rec
    new_receipt = Receipt.new
    @@products_arr.each do |prod|
      new_receipt.add_to_receipt(prod)
    end
    new_receipt.print_list
  end
end
object = Entry.new
object.input
object.print_rec

