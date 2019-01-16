desc "fetch and update current nba standings"
task :update_nba_standings => :environment do
  response = HTTParty.get("http://data.nba.net/10s/prod/v1/current/standings_all.json")

  current_team_standings = response["league"]["standard"]["teams"]

  current_team_standings.each do |team|
    team_to_update = Team.find_by(nba_id: team["teamId"])
    team_to_update.update_attributes(
      projected_wins: team["winPct"].to_f * 82
    )
    puts "#{team_to_update.name} updated!"
  end
end