class Slug
  include Comparable
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    quoteless.parameterize
  end

  def as_json(*)
    to_s
  end

  def <=>(other)
    to_s <=> Slug.new(other).to_s
  end

  private

  def quoteless
    name.gsub /['"`]/, ''
  end
end
