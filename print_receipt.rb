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
    @price_total += item.price
    @tax_total += item.tax
    @qty_total += item.qty
    @grand_total = (@price_total * @qty_total) + @tax_total
  end

  def print_list
    @list.each do |product|
      puts "#{product.qty} #{product.item_name}: #{product.price}"
    end
    # puts "Subtotal: #{@price_total}"
    puts "Sales Taxes: #{@tax_total}"
    puts "Total: #{@grand_total}"
  end
end
