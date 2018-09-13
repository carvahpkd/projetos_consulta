require 'mongoid'

# DB Setup
Mongoid.load! 'mongoid.yaml'

# Models
class Post
  include Mongoid::Document

  field :title, type: String
  field :image, type: String
  field :description, type: String
  field :created_date, type: String

  validates :title, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :created_date, presence: true

  index({ title: 'text' }, name: 'title_index')
  index({ description: 'text' }, name: 'description_index')

  scope :title, ->(title) { where(title: /#{title}*/) }
  scope :description, ->(description) { where(description: /#{description}*/) }
end
