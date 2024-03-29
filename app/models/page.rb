class Page < ActiveRecord::Base
  belongs_to :site
  belongs_to :author, :class_name => "User"
  extend FriendlyId
  friendly_id :title, :use => :scoped, :scope => :site
  liquid_methods :id, :title, :author, :content, :created_at
end
