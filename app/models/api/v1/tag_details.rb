module Api
  module V1
    TagDetails = Struct.new :t do
      include Rails.application.routes.url_helpers

      def as_json(*)
        {
          slug: t.slug
        }
      end
    end
  end
end
