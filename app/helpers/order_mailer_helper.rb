# frozen_string_literal: true

module OrderMailerHelper
  def total_weight(order_list)
    weight = 0
    order_list.each do |part|
      weight += part.quantity * part.weight
    end
    weight
  end

  def total_order_delivery_weight(order_lists)
    order_lists.sum { |list| (list.delivery_quantity || 0) * (list.part.weight || 0) }
  end
end
