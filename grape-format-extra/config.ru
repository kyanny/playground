require 'grape'

class TwitterAPI < Grape::API
  resource 'a' do
    post '/' do
      { hello: params.hello, postdata: env['rack.input'].read }
    end
  end

  resource 'b' do
    format :json
    post '/' do
      { hello: params.hello, postdata: env['rack.input'].read }
    end
  end

  resource 'c' do
    default_format :json
    post '/' do
      { hello: params.hello, postdata: env['rack.input'].read }
    end
  end

  resource 'd' do
    format :json
    default_format :json
    post '/' do
      { hello: params.hello, postdata: env['rack.input'].read }
    end
  end

  resource 'e' do
    content_type :csv, 'text/csv'
    post '/' do
      { hello: params.hello, postdata: env['rack.input'].read }
    end
  end

  resource 'f' do
    content_type :csv, 'text/csv'
    format :csv
    post '/' do
      { hello: params.hello, postdata: env['rack.input'].read }
    end
  end

  resource 'g' do
    content_type :csv, 'text/csv'
    default_format :csv
    post '/' do
      { hello: params.hello, postdata: env['rack.input'].read }
    end
  end

  resource 'h' do
    content_type :csv, 'text/csv'
    format :csv
    default_format :csv
    post '/' do
      { hello: params.hello, postdata: env['rack.input'].read }
    end
  end

  # it could be enough if can prepare CSV string (perhaps no need to call `to_s')
  resource 'i' do
    content_type :csv, 'text/csv'
    default_format :csv
    formatter :csv, ->(object, env) { object.to_s }
    post '/' do
      { hello: params.hello, postdata: env['rack.input'].read }
    end
  end

  # final version
  resource 'j' do
    content_type :csv, 'text/csv'
    default_format :csv
    formatter :csv, ->(object, env) {
      require 'csv'
      object.to_a.flatten.to_csv
    }
    post '/' do
      { hello: params.hello, postdata: env['rack.input'].read }
    end
  end

  # more simple final version
  resource 'j2' do
    content_type :csv, 'text/csv'
    default_format :csv
    post '/' do
      body "hello,#{params.hello},#{env['rack.input'].read}"
    end
  end

  # most simple final version
  resource 'j3' do
    post '/' do
      content_type 'text/csv'
      body "hello,#{params.hello},#{env['rack.input'].read}"
    end
  end

  # same to `j' but request parameter is different
  resource 'k' do
    content_type :csv, 'text/csv'
    default_format :csv
    formatter :csv, ->(object, env) {
      require 'csv'
      object.to_a.flatten.to_csv
    }
    post '/' do
      { hello: params.hello, postdata: env['rack.input'].read }
    end
  end

  # override :json
  resource 'l' do
    format :json
    default_format :json
    formatter :json, ->(object, env) {
      require 'csv'
      object.to_a.flatten.to_csv
    }
    post '/' do
      { hello: params.hello, postdata: env['rack.input'].read }
    end
  end

  # override :json but specify content_type
  resource 'm' do
    format :json
    default_format :json
    formatter :json, ->(object, env) {
      require 'csv'
      object.to_a.flatten.to_csv
    }
    post '/' do
      content_type 'text/csv'
      { hello: params.hello, postdata: env['rack.input'].read }
    end
  end

  resource 'x' do
    format :json
    default_format :json

    resource 'a' do
      content_type :txt, 'text/plain'
      format :txt
      post '/' do
        { hello: params.hello, postdata: env['rack.input'].read }
      end
    end

    resource 'b' do
      content_type :txt, 'text/plain'
      default_format :txt
      post '/' do
        { hello: params.hello, postdata: env['rack.input'].read }
      end
    end

    resource 'c' do
      content_type :binary, 'application/octet-stream'
      format :binary
      post '/' do
        { hello: params.hello, postdata: env['rack.input'].read }
      end
    end

    resource 'd' do
      content_type :binary, 'application/octet-stream'
      default_format :binary
      post '/' do
        { hello: params.hello, postdata: env['rack.input'].read }
      end
    end

    resource 'e' do
      params do
        requires :hello, type: String
      end
      post '/' do
        content_type 'text/csv'
        body "hello,#{params.hello},#{env['rack.input'].read}"
      end
    end
  end

  ### another ones

  resource 'z' do
    content_type :xml, 'text/html; charset=utf-8'
    format :xml
    default_format :xml
    parser :xml, ->(object, env) { Rack::Utils.parse_nested_query object }
    post '1' do
      { hello: params.hello, postdata: env['rack.input'].read }
    end
  end

  resource 'z' do
    content_type :custom, 'text/html; charset=utf-8'
    format :custom
    default_format :custom
    parser :custom, ->(object, env) { Rack::Utils.parse_nested_query object }
    formatter :custom, ->(object, env) { object.to_xml }
    post '2' do
      { hello: params.hello, postdata: env['rack.input'].read }
    end
  end
end

run TwitterAPI
