class Item < ActiveRecord::Base

  extend Enumerize
  include Rails.application.routes.url_helpers

  WHITE = 1
  GREEN = 2
  BLUE = 3
  PURPLE = 4
  ORANGE = 5
  COLOR_MAPPING = {
    WHITE => "white",
    GREEN => "green",
    BLUE => "blue",
    PURPLE => "purple",
    ORANGE => "orange"
  }

  has_many :rel_set_items
  IMG_PATH = "items/"

  enumerize :item_type, in: {:white => WHITE, :green => GREEN, :blue => BLUE, :purple => PURPLE, :orange => ORANGE}, predicates: true

  def img_path
    return IMG_PATH + self.img_url
  end

  def get_color
    case self.item_type
    when WHITE
      return COLOR_MAPPING[WHITE]
    when GREEN
      return COLOR_MAPPING[GREEN]
    when BLUE
      return COLOR_MAPPING[BLUE]
    when PURPLE
      return COLOR_MAPPING[PURPLE]
    when ORANGE
      return COLOR_MAPPING[ORANGE]
    else
      Rails.logger.debug("Error")
    end
  end
end
