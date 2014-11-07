class Slug
  include Comparable
  attr_reader :name, :options

  def initialize(name, options={})
    @name = name.to_s
    @options = options
  end

  def to_s
    quoteless.parameterize.downcase
  end

  def as_json(*)
    to_s
  end

  def <=>(other)
    to_s <=> Slug.new(other).to_s
  end

  private

  def quoteless
    slug = name.gsub(/['"`]/, '')

    if options == :clean
      slug.gsub!(/[^0-9a-zA-Z]+/, '')
    end
    slug
  end
end
