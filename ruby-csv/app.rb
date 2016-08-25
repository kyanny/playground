require 'csv'

File.write 'a.csv', <<CSV
Name,Price,Amount
Apple,80,3
Orange,65,7
CSV

csv = CSV.read('a.csv', headers: true, quote_char: "\x00").to_s
p csv                           # =>

CSV.new(csv, headers: true, quote_char: "\x00").each do |row|
  p row                         # =>
  p [row['Name'], row[:Price], row['Amount']] # =>
end

File.unlink('a.csv')
