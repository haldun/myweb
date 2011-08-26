class SiteObserver < ActiveRecord::Observer
  observe :site

  def after_save site
    Rails.cache.write "sites/#{site.name}", site
  end

  def after_destroy site
    Rails.cache.delete "sites/#{site.name}"
  end
end
