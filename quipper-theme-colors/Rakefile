require 'erb'

task :default do
  template = File.read('index.html.erb')
  [
    ['blue-lighter', 'c9eff7'],
    ['blue-light', '90ddef'],
    ['blue', '18b3dc'],
    ['blue-dark', '0f83ae'],
    ['blue-darker', '076085'],
    ['live-light', '73d4ca'],
    ['live', '05c4a7'],
    ['live-dark', '00a286'],
    ['video-light', 'f099bb'],
    ['video', 'e95d91'],
    ['video-dark', 'bf4675']
  ].each do |(name, color)|
    html = ERB.new(template).result(binding)
    File.write("#{name}.html", html)
  end

  color = 'ffffff' # primary
  html = ERB.new(template).result(binding)
  File.write("index.html", html)
end
