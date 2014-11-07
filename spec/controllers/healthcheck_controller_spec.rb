require 'spec_helper'

describe HealthcheckController do
  context "#healthcheck" do
    it "verifies availability of healthcheck end point" do
      get :index, format: :json
      expect(JSON.parse(response.body)) == { "status" => "ok" }
    end
  end
end
