class Image < ActiveRecord::Base
  attr_accessor :host
  before_save :process_image, :calculate_price

  private

  def process_image
    self.url = "#{self.host}/icons/#{ImageProcessor.new(self.url).process}"
  end

  def calculate_price
    self.price = 11.0005
  end

end
