require 'macrodown'

pdf = Kramdown::Document.new('\\theorem{hello}', input: 'Macrodown').to_pdf

File.open('note.pdf', 'w') do |f|
  f.write(pdf)
end