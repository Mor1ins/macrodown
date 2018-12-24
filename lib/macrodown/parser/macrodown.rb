require 'kramdown'
require 'kramdown/parser'

module Kramdown
  module Parser
    class Macrodown < Kramdown
      def initialize(*doc)
        super
        @span_parsers.unshift(:theorem)
      end

      THEOREM_START = /\\theorem{(.*?)}/u

      # Introduce new {{target}} syntax for empty xrefs, which would
      # otherwise be an ugly ![!](target) or ![ ](target)
      # (I'd rather use [[target]], but that somehow clashes with links.)
      def parse_theorem
        @src.pos += @src.matched_size
        matched = @src.matched.split(/[{}]/)[1]
        @tree.children << Element.new(:theorem, matched)
      end
      define_parser(:theorem, THEOREM_START)
      #
      # IREF_START = /\(\(\((.*?)\)\)\)/u
      #
      # # Introduce new (((target))) syntax for irefs
      # def parse_iref
      #   @src.pos += @src.matched_size
      #   href = @src[1]
      #   el = Element.new(:iref, nil, {'target' => href}) # XXX
      #   @tree.children << el
      # end
      # define_parser(:iref, IREF_START, '\(\(\(')

    end
  end
end