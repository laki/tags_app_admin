class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, through: :post_tags

  validates :name, presence: true, length: { maximum: 50 }
  validates :slug, presence: true, length: { maximum: 50 }, uniqueness: true

  after_initialize :calculate_slug
  after_validation :revert_slug

  private
  def calculate_slug
    self.slug ||= Slug.new(name, :clean).to_s
  end

  def revert_slug
    self.slug = changes[:slug].first if errors.present? and slug_changed?
  end
end
