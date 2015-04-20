require 'seize'
require 'nokogiri'

describe Seize::Extractors::TitleExtractor do
  let(:open_graph) { "<meta property=\"og:title\" content=\"Open Graph\" />" }
  let(:twitter)    { "<meta property=\"twitter:title\" content=\"Twitter\" />" }
  let(:title_tag)  { "<head><title>Title Tag</title></head>" }
  subject { described_class.new(Nokogiri::HTML("<html>#{content}</html>")) }

  context "when all tags are available" do
    let(:content) { [open_graph, twitter, title_tag].join }

    it "returns og:title content" do
      expect(subject.extract).to eq("Open Graph")
    end
  end

  context "when twitter, and title tag are available" do
    let(:content) { [twitter, title_tag].join }

    it "returns twitter:title content" do
      expect(subject.extract).to eq("Twitter")
    end
  end

  context "when only title tag is available" do
    let(:content) { title_tag }

    it "returns its inner text" do
      expect(subject.extract).to eq("Title Tag")
    end
  end

  context "when no supported tag is available" do
    let(:content) { "" }

    it "returns nil" do
      expect(subject.extract).to be_nil
    end
  end
end
