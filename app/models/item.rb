class Item < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  WHITE = 1
  GREEN = 2
  BLUE = 3
  PURPLE = 4
  ORANGE = 5
  TYPE_MASTERS = {
    "white" => WHITE,
    "green" => GREEN,
    "blue" => BLUE,
    "purple" => PURPLE,
    "orange" => ORANGE
  }
  IMG_PATH = "assets/items/"

  has_many :rel_set_items

  # enumerize :item_type, in: {:white => WHITE, :green => GREEN, :blue => BLUE, :purple => PURPLE, :orange => ORANGE}, predicates: true
  validates :name, presence: true


  def img_path
    return IMG_PATH + img_url
  end

  def get_color
    return TYPE_MASTERS.key(self.item_type)
  end

  def methods_json
    return {
      :img_path => self.img_path,
      :color => self.get_color
    }
  end

  def self.compact_json
    return {
      :include => {},
      :methods => :methods_json
    }
  end
end
