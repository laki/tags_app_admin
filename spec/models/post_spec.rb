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

    it "allows private posts" do
      expect(FactoryGirl.create(:post, :private)).to be_valid
    end
  end

  context "Default values" do
    let(:post) { FactoryGirl.create(:post) }

    it "has a correct slug" do
      expect(post.slug).to eq "#{Slug.new(post.title)}"
    end

    it "has private set to false" do
      expect(post.is_private).to be false
    end
  end

  context "scopes" do
    let!(:personal) { FactoryGirl.create(:post, :private) }
    let!(:visible) { FactoryGirl.create(:post) }
    let!(:deleted) { FactoryGirl.create(:post, :deleted) }

    describe "self#personal" do
      it "includes personal posts" do
        expect(Post.personal).to include personal
      end
    end

    describe "self#visible" do
      it "includes publicly visible posts" do
        expect(Post.visible).to include visible
      end
    end

    describe "self#default_scope" do
      it "dose not include deleted posts" do
        expect(Post.all).to_not include deleted
      end
    end
  end
end
