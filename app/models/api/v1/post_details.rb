module Api
  module V1
    PostDetails = Struct.new :p do
      include Rails.application.routes.url_helpers

      def as_json(*)
        {
          id: p.id,
          title: p.title,
          slug: p.slug,
          description: p.description,
          link: p.link,
          tags: tags(p.tags)
        }
      end

      private
      def tags(t)
        t.map { |tag| TagDetails.new(tag) }
      end
    end
  end
end
