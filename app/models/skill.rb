class Skill < ActiveRecord::Base
  IMG_PATH = "skills/"
  IMAGES = Dir.glob("app/assets/images/skills/*.jpg").map{|img| "assets/" + img.split('images/')[1]}

  belongs_to :hero

  def img_path
    return  "assets/" + IMG_PATH + self.img_url
  end

  def methods_json
    return {
      :img_path => self.img_path
    }
  end

  def self.compact_json
    return {
      :include => {},
      :methods => :methods_json
    }
  end
end
