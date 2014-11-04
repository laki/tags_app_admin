module Api
  module V1
    PostDetails = Struct.new :p do
      include Rails.application.routes.url_helpers

      def as_json(*)
        {
          id: p.id,
          is_private: p.is_private,
          title: p.title,
          slug: p.slug,
          description: p.description,
          link: p.link
        }
      end
    end
  end
end
