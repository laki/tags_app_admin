require 'spec_helper'

describe Tag do
  context "Validation" do
    it "has a valid factory" do
      expect(FactoryGirl.create(:tag)).to be_valid
    end

    it "is invalid without a name" do
      expect(FactoryGirl.build(:tag, name: nil)).to_not be_valid
    end
  end

  context "Slugify" do
    it "has a correct slug" do
      tag = FactoryGirl.create(:tag)
      expect(tag.slug).to eq "#{Slug.new(tag.name)}"
    end

    it "has a correct slug" do
      tag = FactoryGirl.create(:tag)
      expect(tag.slug).to eq "#{Slug.new(tag.name)}"
    end

    it "has a slug without any special characters" do
      tag = FactoryGirl.create(:tag, name: "_.~`Another-World`~._", slug: "anotherworld")
      expect(tag.slug).to eq "#{Slug.new(tag.name, :clean)}"
    end
  end
end
