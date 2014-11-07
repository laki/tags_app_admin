class Tag < ActiveRecord::Base
  before_validation :calculate_slug
  validates_presence_of :name, :slug
  validates_uniqueness_of :slug
  after_validation :revert_slug

  private

  def calculate_slug
    self.slug ||= Slug.new(name, :clean).to_s
  end

  def revert_slug
    self.slug = changes[:slug].first if errors.present? and slug_changed?
  end
end
