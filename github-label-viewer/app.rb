require 'sinatra'
require 'octokit'
require 'slim'
require 'active_support/all'
require 'pp'
require 'dotenv'

before do
  Dotenv.load
end

get '/*' do
  label = params['splat'].first
  client = Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
  @repo = ENV['repo']
  if label.present?
    @label = client.label(@repo, label)
  end
  if @label.present?
    @labels = client.issues(@repo, labels: @label.name).flat_map{ |issue| issue.labels }.uniq { |label| label.name }.sort_by { |label| label.name }
  else
    @labels = client.labels(@repo).sort_by { |label| label.name }
  end
  slim :index
end
