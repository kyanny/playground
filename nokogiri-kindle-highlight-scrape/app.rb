require 'nokogiri'

file = ARGV[0]
till   = ARGV[1]

if !file || !till
  puts <<USAGE
Usage:
  $ ruby #{$0} 'Amazon Kindle_ Your Highlights.html' B009CTXQT2_275

USAGE
  exit
end

doc = Nokogiri::HTML(File.read(ARGV[0]))

all = doc.search('.highlightRow.yourHighlight')
ignorable = doc.search("##{till} ~ .highlightRow.yourHighlight")

(all - ignorable).each do |node|
  text = if node.attr('class').to_s.match(/noteOnly/)
           node.search('span.context').text
         else
           node.search('span.highlight').text
         end

  unless node.search('.editNote').search('.noteContent').text.empty?
    note = node.search('.editNote').search('.noteContent').text
  end

  if note
    puts <<TEXT
> #{text}

Note: #{note}

TEXT
  else
    puts <<TEXT
> #{text}

TEXT
  end
end
