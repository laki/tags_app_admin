module Api
  module V1
    InvalidTag = Class.new StandardError

    class TagBuilder
      attr_reader :params

      def initialize(params)
        @params = params
      end

      def save
        Tag.create! params
      rescue => e
        raise InvalidPost, e.message
      end
    end
  end
end
