module ApplicationHelper

  def sorted_categories
    ["stenders", "horisontals", "planks", "diagonals", "rekkverks", "fotlists", "consolers", "consolers", "UTV TRAPP", "akcesoria", "barelle"]
  end


  


  def total_delivery_weight(order_lists, order_storage_lists)
    weight = 0
    order_lists.each do |list|
      weight += list.delivery_quantity * list.part.weight
    end
    order_storage_lists.each do |list|
      weight += list.quantity * list.weight
    end
    weight
  end
end
