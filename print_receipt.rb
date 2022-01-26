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
  end

  def print_list
    @list.each do |product|
      puts "#{product.qty} #{product.item_name}: #{((product.price + product.tax)*20).round/20.0}"
    end
    puts "Sales Taxes: #{(@tax_total*20).round/20.0}"
    puts "Total: #{(@price_total*20).round/20.0 + (@tax_total*20).round/20.0}"
  end
end
