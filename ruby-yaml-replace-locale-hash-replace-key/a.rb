require 'yaml'
def empty hash
  hash.each do |k,v|
    case
    when v.is_a?(Hash)
      empty(v)
    else
      hash[k] = nil
    end
  end
end
data = YAML.load_file('ja.yml')
data = empty(data)
data['en'] = data.delete('ja')
data = YAML.dump(data)
File.write('en.yml', data)
