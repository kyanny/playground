Scrape/extract kindle highlights by Nokogiri
============================================

1. Login to https://kindle.amazon.com/ (or https://kindle.amazon.co.jp/ maybe)
2. Navigate to https://kindle.amazon.com/your_highlights
3. Scroll down until highlights you want to scrape are displayed in page
4. Download full web page
5. Find "next" book's highlight header id attribute in that html
6. `$ ruby app.rb 'Amazon Kindle_ Your Highlights.html' B009CTXQT2_275`

TODO:

- Don't assume target book is latest one
