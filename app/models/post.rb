class Post < ActiveRecord::Base
  before_validation :calculate_slug

  validates_presence_of :title, :ip_address, :slug
  validates_length_of :title, maximum: 100
  validates_length_of :description, maximum: 1000
  validates_format_of :link, with: URI::regexp(%w(http https))

  after_validation :revert_slug

  normalize_attributes :title, :description, :url

  has_many :post_tags
  has_many :tags, through: :post_tags

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
