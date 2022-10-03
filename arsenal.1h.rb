#!/usr/bin/env /Users/alangarcia/.rbenv/shims/ruby
# <xbar.var>string(FOOTBALL_API_KEY=""): Football-data-org api key</xbar.var>
require "http"

response = HTTP
  .headers('Content-Type': "application/json",
           'X-Auth-Token': ENV["FOOTBALL_API_KEY"])
  .get("http://api.football-data.org/v4/teams/57/matches")
data = response.parse
matches = data["matches"]
index = 0

while index < matches.length
  match = matches[index]
  if match["status"] == "SCHEDULED"
    mytime = (match["utcDate"])
    mytime = Time.parse(mytime).localtime.strftime("%b %e
        , %l:%M %p")
    puts "#{match["homeTeam"]["name"]} vs #{match["awayTeam"]["name"]} at #{mytime}"
  end
  index += 1
end

#TODO - split the game into header and subheader in xbar up top
# pp "#{data["matches"]} | color=red"
