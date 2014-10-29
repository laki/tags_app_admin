require 'spec_helper'

describe Post do
  context "Validation" do
    it "has a valid factory" do
      expect(FactoryGirl.create(:post)).to be_valid
    end

    it "is invalid without a title" do
      expect(FactoryGirl.build(:post, title: nil)).to_not be_valid
    end

    it "is invalid without IP address" do
      expect(FactoryGirl.build(:post, ip_address: nil)).to_not be_valid
    end

    it "has a correct slug" do
      post = FactoryGirl.create(:post)
      expect(post.slug).to eq "#{Slug.new(post.title)}"
    end
  end
end
