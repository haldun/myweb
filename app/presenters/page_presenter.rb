class PagePresenter
  def initialize page, theme = nil
    @page = page
    @site = page.site
    @theme = theme || @site.current_theme
  end

  def render
    base_template = Liquid::Template.parse(@theme.template('base').content)
    page_template = Liquid::Template.parse(@theme.template('page').content)
    base_template.render(
      'site' => @site,
      'content_for_layout' => page_template.render(
        'site' => @site,
        'page' => @page,
        'theme' => @theme
      ),
      'theme' => @theme
    )
  end

  # TODO This module is nonsense here
  module PageFilters
    include ActionView::Helpers::TagHelper

    def stylesheet_tag input
      tag :link,
          :rel => :stylesheet,
          :href =>"/assets/#{@context['theme'].directory_name}/stylesheets/#{input}.css"
    end
  end

  Liquid::Template.register_filter(PageFilters)
end
