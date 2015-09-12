class Item < ActiveRecord::Base
  has_many :rel_set_items

  def img_path
    return "items/" + self.img_url
  end
end
