module Api
  module V1
    InvalidTag = Class.new StandardError

    class TagBuilder
      attr_reader :params

      def initialize(params)
        @params = params
      end

      def save
        tags = []
        tag_names.each do |tag_name|
          tags << Tag.create!(name: tag_name)
        end
        tags

      rescue => e
        raise InvalidTag, e.message
      end

      private

      def tag_names
        params[:name].split(' ')
      end
    end
  end
end
