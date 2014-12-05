module Api
  module V1
    class TagsController < ApplicationController
      respond_to :json

      def index
        tags = Tag.all
        render json: json_response(Tag.all)
      end

      def create
        begin
          tags = TagBuilder.new(tag_params).save
          render json: json_response(tags), status: 201
        rescue => e
          render json: { errors: e.message }, status: :unprocessable_entity
        end
      end

      private
      def tag_params
        params.permit(:name)
      end

      def json_response(tags)
        {
          tags: tags.map { |tag| TagDetails.new(tag) }
        }
      end
    end
  end
end
