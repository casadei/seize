require 'seize'
require 'nokogiri'

describe Seize::Extractors::KeywordsExtractor do
  subject { described_class.new(Nokogiri::HTML("<html>#{content}</html>")) }

  context "when keywords is available" do
    let(:content) { "<meta name=\"keywords\" content=\"keywords\" />" }

    it "returns meta[name='keywords'] content" do
      expect(subject.extract).to eq("keywords")
    end
  end

  context "when no supported tag is available" do
    let(:content) { "" }

    it "returns nil" do
      expect(subject.extract).to be_nil
    end
  end
end
