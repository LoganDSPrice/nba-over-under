desc "Grabs standings from NBA api and evaluates all picks"
task evaluate_picks: :environment do
  url = "http://data.nba.net/10s/prod/v1/current/standings_all.json"
  response = HTTParty.get(url)
  parsed = response.parsed_response
  standings = parsed["league"]["standard"]["teams"]
  # ap standings
  beat_the_line_hash = {}

  standings.each do |t|
    team = Team.find_by(nba_id: t["teamId"])
    beat_the_line_hash[team] = ( (t["winPct"].to_f * 82) > team.line )
  end
  # ap beat_the_line_hash

  all_picks = Pick.all
  pick_result_hash = {}

  all_picks.each do |pick|
    if pick.over && beat_the_line_hash[pick.team]
      pick_result_hash[pick] = "Correct"
    else
      pick_result_hash[pick] = "Incorrect"
    end
  end

  ap pick_result_hash
  # ap pick_result_hash.count { |k,v| v == "Correct"}

  # logan_results =  pick_result_hash.select { |k,v| k.contestant.name == "Logan"}

  # ap logan_results.select { |k,v| v == "Correct"}
end
