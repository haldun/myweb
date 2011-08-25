class Asset < ActiveRecord::Base
  class_attribute :asset_directory_name

  belongs_to :site
  belongs_to :theme
  before_save :set_site

  def publish!
    if asset_directory_name.present?
      filename = File.join(theme.directory_path, asset_directory_name, name)
      File.open(filename, 'w') {|f| f.write(content) }
      update_attribute :path, File.join(theme.directory_name, "#{asset_directory_name}/#{name}")
    end
  end

  private
  def set_site
    self.site_id = self.theme.site_id
  end
end
