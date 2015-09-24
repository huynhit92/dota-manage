module HtmlHelper
  def gen_hero_index(hero)
    link_to hero_path(hero.id) do
      image_tag hero.img_path, :class => "img_hero"
    end
  end

  def gen_item_index(item)
    link_to item_path(item.id) do
      content_tag(:i, nil, class: "sprite-#{item.get_color}-sm") + " " + image_tag(item.img_path, :class => "img_item")
    end
  end
end