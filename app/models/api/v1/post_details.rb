module Api
  module V1
    PostDetails = Struct.new :p do
      include Rails.application.routes.url_helpers

      def as_json(*)
        {
          id: p.id,
          title: p.title,
          description: p.description,
          link: p.link
        }
      end
    end
  end
end
