class User < ApplicationRecord

  def authentication_by_image external_image
    percent = image_difference_percent(external_image)
    return true if percent <= 0.10
    false
  end

  def image_difference_percent(external_image)
    longer = [image.size, external_image.size].max
    same   = image.each_char.zip(external_image.each_char).select { |a,b| a == b }.size
    (longer - same) / image.size.to_f
  end

end
