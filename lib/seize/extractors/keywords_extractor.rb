module Seize
  module Extractors
    class KeywordsExtractor < Seize::Extractor
      def precedence
        Enumerator.new do |y|
          y.yield document.xpath('//meta[@name="keywords"]/@content').text
        end
      end
    end
  end
end
