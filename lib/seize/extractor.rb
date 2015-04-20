require 'active_support/core_ext/object'

module Seize
  class Extractor
    attr_reader :document

    def initialize(document)
      @document = document
    end

    def blank_value; end;

    def extract
      precedence.detect(&:present?) || blank_value
    end

    def precedence
      raise "Must be implemented by inherited class."
    end

    def property_name
      self.class.name.underscore.sub(/_extractor$/, '')
    end
  end
end
