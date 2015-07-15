class Pricing

  def initialize(image)
    @image = image
    @price = 0
  end

  def pricing_rules
    {
      "image"                               => "price = 0.001",
      "image.origin_kb > 100"               => "price += 0.01",
      "image.content_type == 'image/gif'"   => "price += 0.005"
    }
  end

  def calculate
    pricing_rules.each do |condition, action|
      if eval condition, get_binding(@image, @price)
        @price = eval action, get_binding(@image, @price)
      end
    end
    @price
  end

  def get_binding(image, price)
    return binding
  end

end