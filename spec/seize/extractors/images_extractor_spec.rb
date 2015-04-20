require 'seize'
require 'nokogiri'

describe Seize::Extractors::ImagesExtractor do
  let(:open_graph) { "<meta property=\"og:image\" content=\"Open Graph\" />" }
  let(:twitter)    { "<meta property=\"twitter:image\" content=\"Twitter\" />" }
  subject { described_class.new(Nokogiri::HTML("<html>#{content}</html>")) }

  context "when all tags are available" do
    let(:content) { [open_graph, twitter].join }

    it "returns og:image content" do
      expect(subject.extract).to match_array(["Open Graph"])
    end
  end

  context "when only twitter:image is available" do
    let(:content) { twitter }

    it "returns twitter:image content" do
      expect(subject.extract).to match_array(["Twitter"])
    end
  end

  context "when no supported tag is available" do
    let(:content) { "" }

    it "returns empty array" do
      expect(subject.extract).to match_array([])
    end
  end
end
