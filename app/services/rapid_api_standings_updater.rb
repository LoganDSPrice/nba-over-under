module RapidApiStandingsUpdater
  def self.run
    standings = RapidApiClient.new.get_standings(season: "2023")

    standings.each do |team|
      nba_team = Team.find_by(rapid_api_team_id: team.dig("team", "id"))
      season_line_to_update = SeasonLine.find_by(team: nba_team, season: Season.active_season)
      wins = team.dig("win", "total")
      losses = team.dig("loss", "total")
      season_line_to_update.update(
        projected_wins: (wins.to_f / (wins + losses) * 82),
        wins: wins,
        losses: losses,
      )
      puts "#{nba_team.name} updated with #{season_line_to_update.projected_wins} projected wins!"
    end
  end
end