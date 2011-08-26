class HomePresenter
  def initialize site
    @site = site
    @theme = site.current_theme
  end

  def render
    base_template = Liquid::Template.parse(@theme.template('base').content)
    index_template = Liquid::Template.parse(@theme.template('index').content)
    base_template.render(
      'site' => @site,
      'content_for_layout' => index_template.render(
        'site' => @site,
        'theme' => @theme
      ),
      'theme' => @theme
    )
  end
end
