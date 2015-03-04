module Api
  module V1
    TagDetails = Struct.new :t do
      include Rails.application.routes.url_helpers

      def as_json(*)
        {
          id: t.id,
          name: t.name,
          slug: t.slug
        }
      end
    end
  end
end
