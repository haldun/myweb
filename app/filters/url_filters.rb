module UrlFilters
  include ActionView::Helpers::TagHelper

  def stylesheet_tag input
    tag :link,
        :rel => :stylesheet,
        :href =>"/assets/#{@context['theme'].directory_name}/stylesheets/#{input}.css"
  end
end
