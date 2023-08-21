module ApplicationHelper

  def sorted_categories
    ["stenders", "horisontals", "planks", "diagonals", "rekkverks", "fotlists", "consolers", "consolers", "UTV TRAPP", "akcesoria", "barelle"]
  end


  def total_weight(order_list)
    weight = 0
    order_list.each do |part|
      
      weight += part.quantity * part.weight
    end
    weight
  end


  def total_delivery_weight(order_lists, order_storage_lists)
    weight = 0
    order_lists.each do |list|
      weight += (list.delivery_quantity || 0) * (list.part.weight || 0 )
    end
    order_storage_lists.each do |list|
      weight += (list.quantity || 0) * (list.weight || 0)
    end
    weight
  end
end
