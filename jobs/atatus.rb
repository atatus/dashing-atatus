require 'faraday'
require 'faraday_middleware'

config = YAML.load File.open("atatus.yml")

conn = Faraday.new(:url => 'https://api.atatus.com', :headers => { 'Accept' => 'application/json' }) do |conn|
  conn.response :json, :content_type => /\bjson$/
  conn.adapter Faraday.default_adapter
end

SCHEDULER.every '30m', :first_in => 0 do

  # Getting performance metrics
  response = conn.get '/api/browser/performances/report' do |req|
    req.params['admin_api_key'] = config[:admin_api_key]
    req.params['timeDur'] = '24h'
  end
  data = response.body
  send_event("atatus_load_time", { current: data['loadTime']})
  send_event("atatus_throughput", { current: data['viewCount']})

  # Getting error count
  response = conn.get '/api/browser/errors/report' do |req|
    req.params['admin_api_key'] = config[:admin_api_key]
    req.params['timeDur'] = '24h'
  end
  data = response.body
  send_event("atatus_error_count", { current: data['errorCount']})

end
