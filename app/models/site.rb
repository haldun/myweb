class Site < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged
  belongs_to :owner, :class_name => "User"
  belongs_to :current_theme, :class_name => "Theme", :foreign_key => "current_theme_id"
  has_many :pages, :dependent => :destroy
  has_many :themes, :dependent => :destroy
  has_many :assets, :dependent => :destroy
  has_many :stylesheets
  has_many :images
  has_many :templates
  has_many :javascripts
  liquid_methods :name, :slug, :title, :tagline

  def to_s
    name
  end
end
