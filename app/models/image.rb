class Image < ActiveRecord::Base
  attr_accessor :host, :processing_error
  before_save :process_image, :calculate_price

  private

  def process_image
    image_meta = ImageProcessor.new(self.origin_url).process
    if image_meta[:error]
      self.processing_error = image_meta[:error]
      return false
    end
    self.origin_kb = image_meta[:origin_size_kb]
    self.content_type = image_meta[:content_type]
    self.url = "#{self.host}/icons/#{image_meta[:saved_name]}"
  end

  def calculate_price
    self.price = Pricing.new(self).calculate
  end

end
