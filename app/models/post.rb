class Post < ActiveRecord::Base
  before_validation :calculate_slug

  validates_presence_of :title, :ip_address, :slug
  validates_length_of :title, maximum: 100
  validates_length_of :description, maximum: 1000

  after_validation :revert_slug

  normalize_attributes :title, :description, :url

  default_scope { where deleted: false }
  scope :personal, -> { where is_private: true }
  scope :visible, -> { where is_private: false }

  private

  def calculate_slug
    self.slug ||= Slug.new(title).to_s
  end

  def revert_slug
    self.slug = changes[:slug].first if errors.present? and slug_changed?
  end
end
