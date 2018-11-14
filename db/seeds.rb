require 'csv'

contestants = [
  {
    name:  "Pavan",
    email: "pavan.sarguru@gmail.com"
  },
  {
    name:  "Logan",
    email: "logandsprice@gmail.com"
  },
  {
    name:  "Peter",
    email: "peterbutzen@gmail.com"
  },
  {
    name:  "Samarth",
    email: "samarth.bhaskar@gmail.com"
  },
  {
    name:  "Piku",
    email: "pulkitgoel92@gmail.com"
  },
  {
    name:  "Neal",
    email: "ndodia2@gmail.com"
  }
]

Contestant.destroy_all
contestants.each do |c|
  contestant = Contestant.new(
    name:  c[:name],
    email: c[:email]
  )
  contestant.save if contestant.valid?
end

url = "http://data.nba.net/10s/prod/v2/2018/teams.json"
response = HTTParty.get(url)
parsed = response.parsed_response
nba_teams = parsed["league"]["standard"].select {|t| t["isNBAFranchise"] == true }

# team_file = File.read("teams.json")
# teams_json = JSON.parse(team_file)
# nba_teams = teams_json["league"]["standard"].select {|t| t["isNBAFranchise"] == true }

Team.destroy_all
nba_teams.each do |t|
  team =  Team.new(
    nba_id: t["teamId"],
    city:   t["city"],
    name:   t["nickname"],
    conference: t["confName"],
    division:   t["divName"]
  )
  team.save if team.valid?
end

Pick.destroy_all
locks = {
  "Pavan" => ["Raptors", "Bulls", "Rockets"],
  "Logan" => ["Celtics", "Bucks", "Bulls"],
  "Peter" => ["76ers", "Rockets", "Kings"],
  "Samarth" => ["Bucks", "Lakers", "Timberwolves"],
  "Piku" => ["Cavaliers", "Timberwolves", "Grizzlies"],
  "Neal" => ["Magic", "Jazz", "Nuggets"]
}
CSV.foreach("picks.csv", headers: true) do |row|
  team = Team.find_by_name(row["Team"])
  team.update_attributes(line: row["Win Total"].to_f)

  row.headers.each do |h|
    if c = Contestant.find_by(name: h)
      team.picks.create(contestant: c, over: row[h] == "OVER", lock: team.name.in?(locks[c.name]))
    end
  end

end
