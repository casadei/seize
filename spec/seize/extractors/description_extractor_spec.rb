require 'seize'
require 'nokogiri'

describe Seize::Extractors::DescriptionExtractor do
  let(:open_graph) { "<meta property=\"og:description\" content=\"Open Graph\" />" }
  let(:twitter)    { "<meta property=\"twitter:description\" content=\"Twitter\" />" }
  let(:meta)       { "<meta name=\"description\" content=\"Meta Description\" />" }
  subject { described_class.new(Nokogiri::HTML("<html>#{content}</html>")) }

  context "when all tags are available" do
    let(:content) { [open_graph, twitter, meta].join }

    it "returns og:description content" do
      expect(subject.extract).to eq("Open Graph")
    end
  end

  context "when twitter:descritpion and meta[name='description'] are available" do
    let(:content) { [twitter, meta].join }

    it "returns twitter:description content" do
      expect(subject.extract).to eq("Twitter")
    end
  end

  context "when only meta[name='description'] is available" do
    let(:content) { meta }

    it "returns meta[name='description'] content" do
      expect(subject.extract).to eq("Meta Description")
    end
  end

  context "when no supported tag is available" do
    let(:content) { "" }

    it "returns nil" do
      expect(subject.extract).to be_nil
    end
  end
end
