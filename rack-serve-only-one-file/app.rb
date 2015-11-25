class App
  def call(env)
    body = File.read('sample.json')
    [ 200, {'Content-Type' => 'application/json'}, [body] ]
  end
end
