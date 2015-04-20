module Seize
  module Extractors
    class DescriptionExtractor < Seize::Extractor
      def precedence
        Enumerator.new do |y|
          y.yield document.xpath('//meta[@property="og:description"]/@content').text
          y.yield document.xpath('//meta[@property="twitter:description"]/@content').text
          y.yield document.xpath('//meta[@name="description"]/@content').text
        end
      end
    end
  end
end
