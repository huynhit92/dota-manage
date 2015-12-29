module ApplicationHelper
  include HtmlHelper
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

  def gen_star(num)
    for i in 1..5 do
      concat image_tag (i <= num) ? 'star.png' : 'star-no.png'
    end
  end

  def gen_star_small(num)
    for i in 1..5 do
      concat image_tag (i <= num) ? 'star.png' : 'star-no.png', :class => "star-bar"
    end
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)

    options = {
      auto_link: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end
end
