class Post < ActiveRecord::Base
  default_scope { where(deleted: false).includes(:tags) }
  scope :personal, -> { where(is_private: true) }
  scope :visible, -> { where(is_private: false) }

  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, presence: true, length: { maximum: 100 }
  validates :ip_address, presence: true
  validates :slug, presence: true
  validates :description, length: { maximum: 1000 }
  validates :link, format: { with: URI::regexp(%w(http https)) }

  before_validation :calculate_slug
  after_validation :revert_slug

  normalize_attributes :title, :description, :url

  private
  def calculate_slug
    self.slug ||= Slug.new(title).to_s
  end

  def revert_slug
    self.slug = changes[:slug].first if errors.present? and slug_changed?
  end
end
