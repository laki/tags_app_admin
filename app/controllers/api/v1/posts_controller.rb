class Api::V1::PostsController < ApplicationController
  respond_to :json

  def index
    render json: { posts: Post.all }
  end
end
