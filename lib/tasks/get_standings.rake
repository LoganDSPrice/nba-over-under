desc "Grabs standings from NBA api"
task get_standings: :environment do
  url = "http://data.nba.net/10s/prod/v1/current/standings_all.json"
  response = HTTParty.get(url)
  parsed = response.parsed_response
  standings = parsed["league"]["standard"]["teams"]

  hash = {}

  standings.each do |t|
    team = Team.find_by(nba_id: t["teamId"])
    hash[team.name] = { "Wins" => t["win"].to_i, "Losses" => t["loss"].to_i, "pct" => t["winPct"].to_f, "over_wins" => ( (t["winPct"].to_f * 82) > team.line )}
  end
  ap hash
end
