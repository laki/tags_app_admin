require 'spec_helper'

describe Api::V1::PostsController do
  it "routes GET /api/v1/posts" do
    expect(get: "/api/v1/posts").to route_to(
      controller: "api/v1/posts",
      action: "index"
    )
  end
end
