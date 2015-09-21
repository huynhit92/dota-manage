module HeroHelper
  def gen_hero_index(hero)
    link_to hero_path(hero.id) do
      image_tag hero.img_path, :class => "img_hero"
    end
  end
end