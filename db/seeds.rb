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
  },
  {
    name:  "Yogen",
    email: "yogenasher@gmail.com"
  },
  {
    name:  "Avinash",
    email: "avinash.sarguru@gmail.com"
  }
]

Contestant.destroy_all
contestants.each do |contestant|
  new_contestant = Contestant.new(
    name:  contestant[:name],
    email: contestant[:email]
  )
  new_contestant.save if new_contestant.valid?
end

url = "http://data.nba.net/10s/prod/v2/2019/teams.json"
response = HTTParty.get(url)
parsed = response.parsed_response
nba_teams = parsed["league"]["standard"].select {|t| t["isNBAFranchise"] == true }


Team.destroy_all
nba_teams.each do |team|
  new_team =  Team.new(
    nba_id: team["teamId"],
    city:   team["city"],
    name:   team["nickname"],
    conference: team["confName"],
    division:   team["divName"]
  )
  new_team.save if new_team.valid?
end

Pick.destroy_all
locks = {
  "Pavan" => ["Hawks", "Pacers", "Knicks"],
  "Logan" => ["Hornets", "Warriors", "Timberwolves"],
  "Peter" => ["Mavericks", "Nuggets", "Heat"],
  "Samarth" => ["Bulls", "Rockets", "Bucks"],
  "Piku" => ["Bulls", "Thunder", "Wizards"],
  "Neal" => ["Pelicans", "Suns", "Kings"],
  "Yogen" => ["Celtics", "Cavaliers", "Warriors"],
  "Avinash" => ["Hawks", "Pelicans", "Knicks"],
}
CSV.foreach("picks.csv", headers: true) do |row|
  team = Team.find_by_name(row["Team"])
  team.update_attributes(line: row["Win Total"].to_f)

  row.headers.each do |header|
    if contestant = Contestant.find_by(name: header)
      team.picks.create(contestant: contestant, over: row[header] == "OVER", lock: team.name.in?(locks[contestant.name]))
    end
  end

end
