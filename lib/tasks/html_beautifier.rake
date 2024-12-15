namespace :html do
  desc "Format all HTML files in app/views"
  task beautify: :environment do
    require 'htmlbeautifier'

    Dir.glob("app/views/**/*.html.erb").each do |file|
      original = File.read(file)
      beautified = HtmlBeautifier.beautify(original)

      if original != beautified
        File.write(file, beautified)
        puts "Beautified: #{file}"
      end
    end
  end
end
