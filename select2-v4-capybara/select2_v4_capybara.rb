require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

include Capybara::DSL

Capybara.default_driver = :selenium
Capybara.app_host = 'https://select2.github.io'

visit '/examples.html'


## Normal select

# Hack: Capybara's `select` DSL requires name attribute of select tag, so need to add attr
execute_script %Q|
$(
  $('.js-example-basic-single')[0]
).attr('name', 'foo');
|
select 'California', from: 'foo'
sleep 2

## Search text (waiting ajax call)

# 1. open text field
within '.js-example-data-ajax + .select2-container' do
  find('.select2-selection__arrow').click
end

# 2. input text (`input` element is rendered in very outside of HTML DOM tree)
within '.select2-dropdown' do
  find('.select2-search__field').send_keys('a')

  # 3. wait for ajax load to choose option
  loop until has_content?('angular/a', wait: 10)

  # 4. choose first one
  find('.select2-search__field').send_keys(:enter)
end

sleep 2
execute_script %Q|
alert('Whoa! Done!');
|
sleep 2
puts "Whoa! Done!"
