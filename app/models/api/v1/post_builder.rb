module Api
  module V1
    InvalidPost = Class.new StandardError

    class PostBuilder
      attr_reader :post_params, :tag_params

      def initialize(params)
        @post_params = params.except(:tag_list)
        @tag_params = params.slice(:tag_list)
      end

      def save!
        post = Post.create!(post_params)
        # TODO: post.taggings.create()
      rescue => e
        raise InvalidPost, e.message
      end

      private
      def tags
        TagBuilder.new(tag_params).save
      end
    end
  end
end
