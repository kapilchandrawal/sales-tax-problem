class Receipt
  def initialize
    @list = []
    @price_total = 0
    @tax_total = 0
    @qty_total = 0
  end
  def add_to_receipt(item)
    @list << item
    item.calculate_tax
    @price_total += item.price * item.qty
    @tax_total += item.tax
    @qty_total = item.qty
    # @grand_total += (@price_total * @qty_total) + item.tax
  end

  def print_list
    @list.each do |product|
      puts "#{product.qty} #{product.item_name}: #{(product.price + product.tax).round(2)}"
    end 
    # puts "Subtotal: #{@price_total}"
    puts "Sales Taxes: #{@tax_total.round(2)}"
    puts "Total: #{@price_total.round(2) + @tax_total.round(2)}"
  end
end
