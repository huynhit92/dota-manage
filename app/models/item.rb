class Item < ActiveRecord::Base
  has_many :rel_set_items
  IMG_PATH = "items/"

  def img_path
    return IMG_PATH + self.img_url
  end
end
