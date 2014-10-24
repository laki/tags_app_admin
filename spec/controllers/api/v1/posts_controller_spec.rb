require 'spec_helper'

describe Api::V1::PostsController do
  context "#index" do
    it "should include created posts" do
      FactoryGirl.create(:post)
      get :index, format: :json
      json_response = JSON.parse(response.body)['posts']
      expect(json_response.count).to eq 1
    end
  end
end
