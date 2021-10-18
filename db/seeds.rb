require 'csv'
AppSetting.create

User.destroy_all
Team.destroy_all
Pick.destroy_all
Enrollment.destroy_all
Lock.destroy_all

users = [
  {
    name:  "Logan",
    email: "logandsprice@gmail.com",
    admin: true,
    password: "password"
  },
  {
    name:  "Pavan",
    email: "pavan.sarguru@gmail.com",
    admin: false
  },
  {
    name:  "Peter",
    email: "peterbutzen@gmail.com",
    admin: false
  },
  {
    name:  "Samarth",
    email: "samarth.bhaskar@gmail.com",
    admin: false
  },
  {
    name:  "Piku",
    email: "pulkitgoel92@gmail.com",
    admin: false
  },
  {
    name:  "Neal",
    email: "ndodia2@gmail.com",
    admin: false
  },
  {
    name:  "Yogen",
    email: "yogenasher@gmail.com",
    admin: false
  },
  {
    name:  "Avinash",
    email: "avinash.sarguru@gmail.com",
    admin: false
  },
  {
    name:  "Vinayak",
    email: "vinayak.ishwar@gmail.com",
    admin: false
  },
]

users.each do |user|
  new_user = User.new(user)
  if new_user.valid?
    new_user.save
  else
    puts new_user.errors.full_messages
  end
end

url = "http://data.nba.net/10s/prod/v2/2019/teams.json"
response = HTTParty.get(url)
parsed = response.parsed_response
nba_teams = parsed["league"]["standard"].select {|t| t["isNBAFranchise"] == true }


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

# locks = {
#   "Logan" => ["Hornets", "Warriors", "Timberwolves"],
#   "Pavan" => ["Hawks", "Pacers", "Knicks"],
#   "Peter" => ["Mavericks", "Nuggets", "Heat"],
#   "Samarth" => ["Bulls", "Rockets", "Bucks"],
#   "Piku" => ["Bulls", "Thunder", "Wizards"],
#   "Neal" => ["Pelicans", "Suns", "Kings"],
#   "Yogen" => ["Celtics", "Cavaliers", "Warriors"],
#   "Avinash" => ["Hawks", "Pelicans", "Knicks"],
# }

# Import 2022 Season Lines for all teams
CsvSeasonLineImporter.import_csv("2022_lines.csv")

# Enroll all users in 2022 season
User.all.each do |user|
  user.enroll_for_season(Season.find_by_active(true))
end

# Create seeder picks
Enrollment.all.includes(:season_lines).find_each do |enrollment|
  enrollment.season_lines.find_each do |season_line|
    season_line.picks.find_or_create_by!(enrollment: enrollment) do |pick|
      pick.over = [true, false].sample
    end
  end

  enrollment.picks.sample(3).each { |pick| pick.create_lock }
end