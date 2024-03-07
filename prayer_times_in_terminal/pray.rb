#!/usr/bin/env ruby
require 'http'
require 'json'
require 'terminal-table'

def get_prayer_times(address, time)
  url = "https://api.aladhan.com/v1/timingsByAddress/#{time}?address=#{address}"

  begin
    response = HTTP.get(url)
    prayer_times_data = JSON.parse(response.body)

    prayer_times = prayer_times_data['data']['timings']
    { status: 'success', data: prayer_times }
  rescue StandardError => e
    { status: 'error', error: "Error fetching prayer times: #{e.message}" }
  end
end

address = 'Mansourah'
time = Time.now
method = '5'

result = get_prayer_times(address, time)
if result[:status] == 'success'
  rows = result[:data].map { |prayer, time| [prayer.capitalize, time] }

  table = Terminal::Table.new do |t|
    t.title = "Prayer Times for #{address} - #{time}"
    t.headings = ['Prayer', 'Time']
    t.rows = rows
  end

  puts table
else
  puts "Error: #{result[:error]}"
end
