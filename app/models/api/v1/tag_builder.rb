module Api
  module V1
    InvalidTag = Class.new StandardError

    class TagBuilder
      attr_reader :tag_list

      def initialize(params)
        @tag_list = params[:tag_list]
      end

      def save
        tags = []
        tag_names.each do |tag_name|
          tag = Tag.new(name: tag_name)
          tags << Tag.create_with(name: tag_name).find_or_create_by(slug: tag.slug)
        end
        tags

      rescue => e
        raise InvalidTag, e.message
      end

      private
      def tag_names
        tag_list.split(' ')
      end
    end
  end
end
