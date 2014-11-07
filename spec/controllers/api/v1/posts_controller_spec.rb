require 'spec_helper'

describe Api::V1::PostsController do
  context "POST #create" do
    let(:post_params) { FactoryGirl.attributes_for(:post) }

    it "creates a post" do
      post :create,
        format: :json,
        title: post_params[:title],
        description: post_params[:description],
        link: post_params[:link],
        ip_address: post_params[:ip_address]

      json_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(response.status).to eq 201
      expect(json_response).to include("post")
    end

    it "validates presence of title, ip_address params" do
      post :create,
        format: :json,
        description: post_params[:description],
        link: post_params[:link]

      json_response = JSON.parse(response.body)

      expect(response.status).to eq 422
      expect(json_response).to include("errors")
      expect(json_response["errors"]).to include "Title can't be blank"
      expect(json_response["errors"]).to include "Ip address can't be blank"
    end

    it "creates a private post" do
      post :create,
        format: :json,
        title: post_params[:title],
        description: post_params[:description],
        link: post_params[:link],
        ip_address: post_params[:ip_address],
        is_private: true

      json_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(response.status).to eq 201
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
