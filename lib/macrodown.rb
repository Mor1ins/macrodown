require 'kramdown'
require 'kramdown/parser'
require 'kramdown/converter'
require 'macrodown/parser/macrodown'
require 'macrodown/converter/macrodown'
require 'kramdown/document'
require 'pdfkit'

my_span_elements = %w[theorem figure xref eref iref cref spanx vspace]
Kramdown::Parser::Html::Constants::HTML_SPAN_ELEMENTS.concat my_span_elements

module Kramdown
  Document.class_eval do
    def to_pdf
      html = self.to_macrodown
      PDFKit.configure do |config|
        config.default_options = {
          page_size: nil,
          margin_top: '0',
          margin_right: '0',
          margin_bottom: '0',
          margin_left: '0',
          page_height: '297',
          page_width: '210'
        }
      end
      kit = PDFKit.new(html, encoding: 'UTF-8')
      kit.stylesheets << 'bootstrap.css'
      kit.to_pdf
    end
  end

  module Parser
    autoload :Macrodown, 'macrodown/parser/macrodown'
  end
  module Converter
    autoload :Macrodown, 'macrodown/converter/macrodown'
  end
end
