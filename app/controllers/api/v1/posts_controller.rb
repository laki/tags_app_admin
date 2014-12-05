module Api
  module V1
    class PostsController < ApplicationController
      respond_to :json

      def index
        render json: json_response(Post.all)
      end

      def create
        begin
          post = PostBuilder.new(post_params).save
          # tags = TagBuilder.new(tag_params).save
          # TODO save post tags, rename post_tags to taggings
          render json: json_response([post]), status: 201
        rescue => e
          render json: { errors: e.message }, status: :unprocessable_entity
        end
      end

      private
      def post_params
        params.permit(
          :title,
          :description,
          :link,
          :ip_address,
          :is_private
        )
      end

      def tag_params
        params.permit(
          :tag_list
        )
      end

      def json_response(posts)
        {
          posts: posts.map { |post| PostDetails.new(post) }
        }
      end
    end
  end
end
