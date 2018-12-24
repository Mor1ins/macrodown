require 'kramdown'
require 'kramdown/converter'
require 'kramdown/element'
require 'kramdown/converter/html'
require 'kramdown/converter/pdf'


Kramdown::Element.class_eval do
  %i[theorem note def lemma result evidence].each { |b| Kramdown::Element::CATEGORY[b] = :block }
end

module Kramdown
  module Converter
    Pdf.class_eval do
      def render_theorem

      end
    end
  end
end

module Kramdown
  module Converter
    class Macrodown < Kramdown
      def initialize(*args)
        super
      end

      def convert_theorem(el, indent)
        res = '<div class="card"><div class="card-header">Теорема</div><div class="card-body"><div class="card-title">'
        res << "<h6>#{el.value}</h6>"
        res << '</div></div></div>'
      end
    end
  end
end
