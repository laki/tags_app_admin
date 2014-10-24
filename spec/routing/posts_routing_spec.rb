require "spec_helper"

RSpec.describe "routes for API", :type => :routing do
  describe "v1" do
    it "routes GET /api/v1/posts" do
      expect(get: "/api/v1/posts").to route_to(
        controller: "api/v1/posts",
        action: "index"
      )
    end
  end

  it "is alive, right?" do
    expect(:get => "/healthcheck").to route_to(
      :controller => "healthcheck",
      :action => "index"
    )
  end
end
