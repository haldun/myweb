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
end
