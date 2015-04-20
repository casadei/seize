module Seize
  module Extractors
    class ImagesExtractor < Seize::Extractor
      def blank_value
        []
      end

      def precedence
        Enumerator.new do |y|
          y.yield document.xpath('//meta[@property="og:image"]/@content').map(&:text)
          y.yield document.xpath('//meta[@property="twitter:image"]/@content').map(&:text)
        end
      end
    end
  end
end
