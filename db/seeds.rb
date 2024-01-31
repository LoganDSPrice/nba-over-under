# require 'csv'
AppSetting.create

Season.destroy_all
User.destroy_all
Team.destroy_all
Pick.destroy_all
Enrollment.destroy_all
Lock.destroy_all

users = [
  {
    name: 'Logan',
    email: 'logandsprice@gmail.com',
    admin: true,
    password: 'password'
  },
  {
    name: 'Pavan',
    email: 'pavan.sarguru@gmail.com',
    admin: false,
    password: 'password'
  },
  {
    name: 'Peter',
    email: 'peterbutzen@gmail.com',
    admin: false,
    password: 'password'
  },
  {
    name: 'Samarth',
    email: 'samarth.bhaskar@gmail.com',
    admin: false,
    password: 'password'
  },
  {
    name: 'Piku',
    email: 'pulkitgoel92@gmail.com',
    admin: false,
    password: 'password'
  },
  {
    name: 'Neal',
    email: 'ndodia2@gmail.com',
    admin: false,
    password: 'password'
  },
  {
    name: 'Yogen',
    email: 'yogenasher@gmail.com',
    admin: false,
    password: 'password'
  },
  {
    name: 'Avinash',
    email: 'avinash.sarguru@gmail.com',
    admin: false,
    password: 'password'
  },
  {
    name: 'Vinayak',
    email: 'vinayak.ishwar@gmail.com',
    admin: false,
    password: 'password'
  },
  {
    name: 'Prateek',
    email: 'PrateekSingh01@gmail.com',
    admin: false,
    password: 'password'
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

# url = "http://data.nba.net/10s/prod/v2/2021/teams.json"
# response = HTTParty.get(url)
# parsed = response.parsed_response
# nba_teams = parsed["league"]["standard"].select {|t| t["isNBAFranchise"] == true }

# nba_teams.each do |team|
#   new_team =  Team.new(
#     nba_id: team["teamId"],
#     city:   team["city"],
#     name:   team["nickname"],
#     conference: team["confName"],
#     division:   team["divName"]
#   )
#   new_team.save if new_team.valid?
# end

Team.create!([
               { nba_id: '1610612737', city: 'Atlanta', name: 'Hawks', conference: 'East', division: 'Southeast' },
               { nba_id: '1610612738', city: 'Boston', name: 'Celtics', conference: 'East', division: 'Atlantic' },
               { nba_id: '1610612751', city: 'Brooklyn', name: 'Nets', conference: 'East', division: 'Atlantic' },
               { nba_id: '1610612766', city: 'Charlotte', name: 'Hornets', conference: 'East', division: 'Southeast' },
               { nba_id: '1610612741', city: 'Chicago', name: 'Bulls', conference: 'East', division: 'Central' },
               { nba_id: '1610612739', city: 'Cleveland', name: 'Cavaliers', conference: 'East', division: 'Central' },
               { nba_id: '1610612742', city: 'Dallas', name: 'Mavericks', conference: 'West', division: 'Southwest' },
               { nba_id: '1610612743', city: 'Denver', name: 'Nuggets', conference: 'West', division: 'Northwest' },
               { nba_id: '1610612765', city: 'Detroit', name: 'Pistons', conference: 'East', division: 'Central' },
               { nba_id: '1610612744', city: 'Golden State', name: 'Warriors', conference: 'West', division: 'Pacific' },
               { nba_id: '1610612745', city: 'Houston', name: 'Rockets', conference: 'West', division: 'Southwest' },
               { nba_id: '1610612754', city: 'Indiana', name: 'Pacers', conference: 'East', division: 'Central' },
               { nba_id: '1610612746', city: 'LA', name: 'Clippers', conference: 'West', division: 'Pacific' },
               { nba_id: '1610612747', city: 'Los Angeles', name: 'Lakers', conference: 'West', division: 'Pacific' },
               { nba_id: '1610612763', city: 'Memphis', name: 'Grizzlies', conference: 'West', division: 'Southwest' },
               { nba_id: '1610612748', city: 'Miami', name: 'Heat', conference: 'East', division: 'Southeast' },
               { nba_id: '1610612749', city: 'Milwaukee', name: 'Bucks', conference: 'East', division: 'Central' },
               { nba_id: '1610612750', city: 'Minnesota', name: 'Timberwolves', conference: 'West', division: 'Northwest' },
               { nba_id: '1610612740', city: 'New Orleans', name: 'Pelicans', conference: 'West', division: 'Southwest' },
               { nba_id: '1610612752', city: 'New York', name: 'Knicks', conference: 'East', division: 'Atlantic' },
               { nba_id: '1610612760', city: 'Oklahoma City', name: 'Thunder', conference: 'West', division: 'Northwest' },
               { nba_id: '1610612753', city: 'Orlando', name: 'Magic', conference: 'East', division: 'Southeast' },
               { nba_id: '1610612755', city: 'Philadelphia', name: '76ers', conference: 'East', division: 'Atlantic' },
               { nba_id: '1610612756', city: 'Phoenix', name: 'Suns', conference: 'West', division: 'Pacific' },
               { nba_id: '1610612757', city: 'Portland', name: 'Trail Blazers', conference: 'West', division: 'Northwest' },
               { nba_id: '1610612758', city: 'Sacramento', name: 'Kings', conference: 'West', division: 'Pacific' },
               { nba_id: '1610612759', city: 'San Antonio', name: 'Spurs', conference: 'West', division: 'Southwest' },
               { nba_id: '1610612761', city: 'Toronto', name: 'Raptors', conference: 'East', division: 'Atlantic' },
               { nba_id: '1610612762', city: 'Utah', name: 'Jazz', conference: 'West', division: 'Northwest' },
               { nba_id: '1610612764', city: 'Washington', name: 'Wizards', conference: 'East', division: 'Southeast' }
             ])

client = RapidApiClient.new
api_teams = client.get_teams
api_teams.each do |api_team|
  team = Team.find_by_name(api_team.dig("nickname"))
  team.update(rapid_api_team_id: api_team.dig("id"))
end

require 'open-uri'

Team.all.each do |team|
  download = URI.open(team.img_url)
  open("app/assets/images/#{download.base_uri.to_s.split('/')[-1]}", 'wb') do |file|
    file << download.read
  end
end

# Import 2022 Season Lines for all teams
# CsvSeasonLineImporter.import_csv("2022_lines.csv")

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

# Enroll all users in 2022 season
# User.all.each do |user|
#   user.enroll_for_season(Season.find_by_active(true))
# end

# Create seeder picks
# Pick.all.each { |pick| pick.update(over: [true, false].sample)}
