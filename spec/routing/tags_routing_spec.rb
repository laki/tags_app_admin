require 'spec_helper'

describe Api::V1::TagsController do
  it "routes GET /api/v1/tags" do
    expect(get: "/api/v1/tags").to route_to(
      controller: "api/v1/tags",
      action: "index"
    )
  end
end
