require 'dragonfly'
Dragonfly.app.configure do
  verify_urls false
  plugin :imagemagick
end
run -> (env) {
  uid = env['REQUEST_URI'][1..-1]
  object = Dragonfly.app.fetch(uid)
  [200, {'Content-Type' => object.mime_type}, [object.data]]
}
