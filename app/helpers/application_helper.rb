module ApplicationHelper
  def active_menu_resolver(args)
    args.each do |controller, actions|
      if controller.to_s == request.params[:controller]
        return 'active' if actions == :all
        actions.each do |action|
          return 'active' if action.to_s == request.params[:action]
        end
      end
    end
    return ''
  end

  def gen_hero_index(hero)
    link_to hero_path(hero.id) do
      image_tag hero.img_path, :class => "img_hero"
    end
  end

  def gen_star(num)
    for i in 1..5 do
      concat image_tag (i <= num) ? 'star.png' : 'star-no.png'
    end
  end
end
