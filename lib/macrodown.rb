require 'kramdown'
require 'kramdown/parser'
require 'kramdown/converter'
require 'macrodown/parser/macrodown'
require 'macrodown/converter/macrodown'

my_span_elements = %w{theorem figure xref eref iref cref spanx vspace}
Kramdown::Parser::Html::Constants::HTML_SPAN_ELEMENTS.concat my_span_elements

module Kramdown
  module Parser
    autoload :Macrodown, 'macrodown/parser/macrodown'
  end
  module Converter
    autoload :Macrodown, 'macrodown/converter/macrodown'
  end
end