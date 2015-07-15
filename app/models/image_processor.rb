require 'RMagick'
require 'open-uri'

class ImageProcessor
  include Magick

  def initialize(origin_url)
    @origin_url = origin_url
  end

  def process
    saved_name = "#{SecureRandom.hex(5)}.jpg"
    file_name = "public/icons/#{saved_name}"
    self.download(@origin_url, file_name)
    saved_name
  end

  def download(uri, filename)
    bytes_total = nil
    begin
      open(uri, read_timeout: 500,
        content_length_proc: lambda {|content_length| bytes_total = content_length}
      ) do |io|
        puts "\n--> TOTAL BYTES: #{bytes_total}"
        puts "\n--> TOTAL KILOBYTES: #{bytes_total/1000} Kb"
        puts "\n--> CONTENT TYPE: #{io.content_type}"
        puts "\n--> FILE EXTENTION: #{File.extname(uri)}"
        puts "\n--> Succeed, writing to #{filename}"
        File.open(filename, 'wb'){|wf| wf.write io.read}
      end
    rescue => err
      puts err
      return
    end
  end

end
