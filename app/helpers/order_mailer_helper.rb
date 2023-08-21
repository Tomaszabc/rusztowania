module OrderMailerHelper

  def total_weight(order_list)
    weight = 0
    order_list.each do |part|
      
    weight += part.quantity * part.weight
    end
    weight
  end

end
