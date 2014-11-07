require 'spec_helper'

describe Tag do
  context "Validation" do
    it "has a valid factory" do
      expect(FactoryGirl.create(:tag)).to be_valid
    end
  end
end
