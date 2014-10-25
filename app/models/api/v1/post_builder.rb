module Api
  module V1
    InvalidPost = Class.new StandardError

    class PostBuilder
      attr_reader :params

      def initialize(params)
        @params = params
      end

      def save
        Post.create! params
      rescue => e
        raise InvalidPost, e.message
      end
    end
  end
end
