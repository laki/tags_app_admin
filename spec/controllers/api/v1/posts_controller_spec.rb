require 'spec_helper'

describe Api::V1::PostsController do
  context "POST #create" do
    let(:post_params) { FactoryGirl.attributes_for(:post) }

    it "creates a post" do
      post :create,
        format: :json,
        title: post_params[:title],
        description: post_params[:description],
        link: post_params[:link]

      expect(response).to be_success
      expect(response.code).to eq('201')
      json_response = JSON.parse(response.body)
      expect(json_response).to include("post")
    end
  end

  context "GET #index" do
    it "should include created posts" do
      FactoryGirl.create(:post)
      get :index, format: :json
      json_response = JSON.parse(response.body)['posts']
      expect(json_response.count).to eq 1
    end
  end
end
