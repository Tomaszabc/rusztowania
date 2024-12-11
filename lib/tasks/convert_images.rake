require 'image_processing/mini_magick'

#'image_processing/vips'  

namespace :images do
  desc "Convert images in app/assets/images to webp with specific settings"
  task convert_to_webp: :environment do
    input_dir = Rails.root.join("app/assets/images")
    output_dir = Rails.root.join("app/assets/images")

    # Pliki do konwersji na format webp 90% jakości
    files_to_convert = %w[
      alfix.jpg
      weight.png
      combisafe.jpg
      haki.jpg
      other.jpg
      peri.jpg
      rullestias.jpg
      scaffold_img.png
    ]

    # Pliki do dodatkowego zmniejszenia (100x100)
    small_files = %w[
      alfix.jpg
      combisafe.jpg
      haki.jpg
      other.jpg
      peri.jpg
      rullestias.jpg
      scaffold_img.png
    ]

    files_to_convert.each do |file_name|
      input_path = input_dir.join(file_name).to_s
      output_path = output_dir.join("#{File.basename(file_name, '.*')}.webp").to_s

      if File.exist?(input_path)
        puts "Processing #{file_name} to webp..."
        processed_image = ImageProcessing::Vips
                          .source(input_path)
                          .convert("webp")
                          .saver(quality: 90)
                          .call(destination: output_path)

        puts "Saved converted image to #{output_path}" if processed_image
      else
        puts "File #{file_name} not found in #{input_dir}"
      end
    end

    small_files.each do |file_name|
      input_path = input_dir.join(file_name).to_s
      output_path = output_dir.join("#{File.basename(file_name, '.*')}_small.webp").to_s

      if File.exist?(input_path)
        puts "Processing #{file_name} to small webp..."
        processed_image = ImageProcessing::Vips
                          .source(input_path)
                          .resize_to_limit(100, 100)
                          .convert("webp")
                          .saver(quality: 90)
                          .call(destination: output_path)

        puts "Saved resized image to #{output_path}" if processed_image
      else
        puts "File #{file_name} not found in #{input_dir}"
      end
    end
  end
end