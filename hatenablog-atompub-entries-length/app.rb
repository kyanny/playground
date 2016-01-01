require 'nokogiri'
require 'open-uri'
require 'dotenv'
require 'yaml'

Dotenv.load

hatena_id = ENV['HATENA_ID']
api_key = ENV['API_KEY']
blog_id = ENV['BLOG_ID']

entries = []

url = "https://blog.hatena.ne.jp/#{hatena_id}/#{blog_id}/atom/entry"
loop do
  break if url.nil?
  open(url, http_basic_authentication: [hatena_id, api_key]) { |f|
    doc = Nokogiri::XML(f.read)
    if node = doc.css('link[rel=next]').first
      url = node['href']
    else
      url = nil
    end
    doc.css('entry').each do |entry|
      entries << {
        title: entry.search('title')[0].text,
        url: entry.search('link[rel=alternate]')[0]['href'],
        content: entry.search('content')[0].text,
      }
    end
  }
end

top10_length = entries.map { |entry|
         entry[:length] = entry[:content].length
         entry
       }.sort_by {
         |entry| entry[:length]
       }.reverse.map { |entry|
         entry.delete(:content)
         entry
       }.take(10)

puts YAML.dump(top10_length)
puts '-------------------------'
puts top10_length.map { |entry|
  <<TXT
- [#{entry[:title]}](#{entry[:url]}) - #{entry[:length]} length
TXT
}
