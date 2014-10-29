class Post < ActiveRecord::Base
  before_validation :calculate_slug
  validates_presence_of :title, :ip_address, :slug
  after_validation :revert_slug

  normalize_attributes :title, :description, :url
  #validates :body, length: { title: 250 }
  #validates :body, length: { description: 1000 }

  private

  def calculate_slug
    self.slug ||= Slug.new(title).to_s
  end

  def revert_slug
    self.slug = changes[:slug].first if errors.present? and slug_changed?
  end
end
