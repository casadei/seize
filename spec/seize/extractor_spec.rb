require 'seize'

describe Seize::Extractor do
  let(:document) { double(:document) }
  subject { described_class.new(document) }

  it "should set document properly" do
    expect(subject.document).to eq(document)
  end

  context "#blank_value" do
    it "returns nil" do
      expect(subject.blank_value).to be_nil
    end
  end

  context "#extract" do
    it "returns the first existing content available in the precedence enumerator" do
      allow(subject).to receive(:precedence).and_return([nil, false, "", "data"])
      expect(subject.extract).to eq("data")
    end
  end

  context "#precedence" do
    it "raises an exception" do
      expect { subject.precedence }.to raise_error("Must be implemented by inherited class.")
    end
  end

  context "#property_name" do
    it "returns friendly name of the property related to the extractor" do
      allow(subject).to receive(:class).and_return(double(name: "TitleExtractor"))
      expect(subject.property_name).to eq("title")
    end
  end
end
