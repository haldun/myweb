class Theme < ActiveRecord::Base
  extend ActiveSupport::Memoizable

  belongs_to :site
  has_many :assets, :dependent => :destroy
  has_many :templates
  has_many :stylesheets
  has_many :images
  has_many :javascripts

  def publish!
    make_directories
    assets.each(&:publish!)
    update_attributes :directory => directory_name, :published_at => Time.now.utc
  end

  def make_directories
    # Create theme directory by removing the old one
    FileUtils.rmtree directory_path
    FileUtils.mkdir_p directory_path

    # Create assets directories
    asset_directories = ['stylesheets', 'javascripts', 'images']
    asset_directories.each do |dir|
      FileUtils.mkdir_p File.join(directory_path, dir)
    end
  end

  def directory_name
    "themes/" + ("%06d" % id).chars.each_slice(3).map(&:join).join("/")
  end

  def directory_path
    File.join(Rails.application.config.root, 'public/assets',  directory_name)
  end

  memoize :directory_name, :directory_path
end
