# frozen_string_literal: true

module ApplicationHelper
  def sorted_categories
    ['stenders', 'horisontals', 'planks', 'diagonals', 'rekkverks', 'fotlists', 'consolers', 'consolers', 'UTV TRAPP',
     'akcesoria', 'barelle']
  end

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

  def total_delivery_weight(order_lists, order_storage_lists)
    weight = 0
    order_lists.each do |list|
      weight += (list.delivery_quantity || 0) * (list.part.weight || 0)
    end
    order_storage_lists.each do |list|
      weight += (list.quantity || 0) * (list.weight || 0)
    end
    weight
  end

  def image_variant(file_name)
    ActiveStorage::Blob.create_and_upload!(
      io: File.open(Rails.root.join("app/assets/images/#{file_name}")),
      filename: file_name,
      content_type: 'image/png' # dostosuj typ MIME
    ).variant(resize_to_limit: [20, 20], format: :webp, quality: 80)
  end

  def pert_image_variant(file_name)
    ActiveStorage::Blob.create_and_upload!(
      io: File.open(Rails.root.join("app/assets/images/#{file_name}")),
      filename: file_name,
      content_type: 'image/png image/jpg' # dostosuj typ MIME
    ).variant(resize_to_limit: [40, 40], format: :webp, quality: 100)
  end
end
