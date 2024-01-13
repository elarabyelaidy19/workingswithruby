#!/usr/bin/env ruby
require 'http'
require 'json'
require 'terminal-table'

def get_prayer_times(city, country, year, month, method)
  url = "https://api.aladhan.com/v1/calendarByCity/#{year}/#{month}"
  headers = { 'Content-Type' => 'application/json' }
  params = { city: city, country: country, method: method }

  begin
    response = HTTP.headers(headers).get(url, params: params)
    prayer_times_data = JSON.parse(response.body)

    # puts prayer_times 
    prayer_times = prayer_times_data['data'][0]['timings']

    { status: 'success', data: prayer_times }
  rescue StandardError => e
    { status: 'error', error: "Error fetching prayer times: #{e.message}" }
  end
end

city = 'Cairo'
country = 'Egypt'
year = Time.now.year.to_s
month = Time.now.month.to_s
method = '2'

result = get_prayer_times(city, country, year, month, method)
# puts result
if result[:status] == 'success'
  rows = result[:data].map { |prayer, time| [prayer.capitalize, time] }.take(7)

  table = Terminal::Table.new do |t|
    t.title = "Prayer Times for #{city}, #{country} - #{year}/#{month}"
    t.headings = ['Prayer', 'Time']
    t.rows = rows
  end

  puts table
else
  puts "Error: #{result[:error]}"
end
