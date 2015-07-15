require 'RMagick'
require 'open-uri'

class ImageProcessor
  include Magick

  def initialize(origin_url)
    @image_meta = {}
    @image_meta[:origin_url] = origin_url
    @image_meta[:extension] = File.extname(origin_url).downcase
    @image_meta[:saved_name] = "#{SecureRandom.hex(5)}#{@image_meta[:extension]}"
    @image_meta[:rel_path] = "public/icons/#{@image_meta[:saved_name]}"
    @allowed_content_types = %w(image/jpeg image/pjpeg image/png image/gif image/bmp image/x-windows-bmp)
    @resized_image_width = 32 # TODO: Change this to 5px, as required in a task
  end

  def process
    download
    puts "\n--> Succeed! META: #{@image_meta.inspect}"
    @image_meta
  end

  private

  def download
    begin
      open(@image_meta[:origin_url], read_timeout: 500) do |io|
        @image_meta[:content_type] = io.content_type.downcase
        if !@allowed_content_types.include?(@image_meta[:content_type])
          raise "Unsupportable content type: #{@image_meta[:content_type]}"
        end
        @image_meta[:origin_size_kb] = File.size(io).to_f / 1000
        image = Magick::Image::from_blob(io.read).first.resize_to_fit(@resized_image_width)
        image.write(@image_meta[:rel_path])
      end
    rescue => err
      @image_meta[:error] = err.to_s
    end
  end

end
