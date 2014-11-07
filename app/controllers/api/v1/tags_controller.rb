module Api
  module V1
    class TagsController < ApplicationController
      respond_to :json

      def index
        render json: { tags: Tag.all }
      end

      def create
        begin
          tag = TagBuilder.new(tag_params).save
          render json: { tag:  TagDetails.new(tag) }, status: 201
        rescue => e
          render json: { errors: e.message }, status: :unprocessable_entity
        end
      end

      private

      def tag_params
        params.permit(:name)
      end
    end
  end
end
