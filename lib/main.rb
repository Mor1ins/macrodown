require 'macrodown'

puts Kramdown::Document.new('\\theorem{hello}', input: 'Macrodown').to_macrodown
