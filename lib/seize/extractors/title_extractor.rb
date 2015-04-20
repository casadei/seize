module Seize
  module Extractors
    class TitleExtractor < Seize::Extractor
      def precedence
        Enumerator.new do |y|
          y.yield document.xpath('//meta[@property="og:title"]/@content').text
          y.yield document.xpath('//meta[@property="twitter:title"]/@content').text
          y.yield document.xpath('//title').text
        end
      end
    end
  end
end
