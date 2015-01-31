module Api
  module V1
    InvalidPost = Class.new StandardError

    class PostBuilder
      attr_reader :post_params, :tag_params, :post

      def initialize(params)
        @post_params = params.except(:tag_list)
        @tag_params = params.slice(:tag_list)
      end

      def save!
        @post = Post.create!(post_params)
        save_taggings
      rescue => e
        raise InvalidPost, e.message
      end

      private
      def save_tags
        TagBuilder.new(tag_params).save
      end

      def save_taggings
        if tags = save_tags
          tags.each { |tag| post.taggings.create(tag: tag) }
        end
        post
      end
    end
  end
end
