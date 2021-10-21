desc "fetch and update current nba standings"
task :update_nba_standings => :environment do
  MAX_RETRIES = 5
  times_retried = 0

  begin
    response = HTTParty.get("http://data.nba.net/10s/prod/v1/current/standings_all.json", timeout: 60)
  rescue Net::ReadTimeout => error
    if times_retried < MAX_RETRIES
      times_retried += 1
      puts "Failed to fetch standings, retry #{times_retried}/#{MAX_RETRIES}"
      retry
    else
      puts "Exiting script."
      exit(1)
    end
  end

  current_team_standings = response["league"]["standard"]["teams"]

  current_team_standings.each do |team|
    nba_team = Team.find_by(nba_id: team["teamId"])
    season_line_to_update = SeasonLine.find_by(team: nba_team, season: Season.active_season)

    season_line_to_update.update(
      projected_wins: team["winPct"].to_f * 82
    )
    puts "#{nba_team.name} updated with #{season_line_to_update.projected_wins} projected wins!"
  end
end