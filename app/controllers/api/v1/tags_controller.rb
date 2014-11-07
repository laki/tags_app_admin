module Api
  module V1
    class TagsController < ApplicationController
      respond_to :json

      def index
        render json: { tags: Tag.all }
      end
    end
  end
end
