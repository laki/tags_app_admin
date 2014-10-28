module Api
  module V1
    class PostsController < ApplicationController
      respond_to :json

      def index
        render json: { posts: Post.all }
      end

      def create
        begin
          post = PostBuilder.new(post_params).save
          render json: { post: PostDetails.new(post) }, status: 201
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
          :ip_address
        )
      end
    end
  end
end
