require 'time'
class App
  def call(env)
    body = File.read('sample.json')
    [ 200, {'Content-Type' => 'application/json', 'Date' => Time.now.utc.httpdate}, [body] ]
  end
end
