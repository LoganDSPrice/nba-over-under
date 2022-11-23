module RapidApiStandingsUpdater
  # def self.run
  #   response = RapidApiClient.new.get_standings

  #   teams = response["reponse"]

  #   teams.each do |team|
  #     nba_team = Team.find_by(nba_id: team.dig("team", "id"))
  #     season_line_to_update = SeasonLine.find_by(team: nba_team, season: Season.active_season)

  #     season_line_to_update.update(
  #       projected_wins: (team["winPct"].to_f * 82),
  #       wins: team["win"],
  #       losses: team["loss"],
  #     )
  #     puts "#{nba_team.name} updated with #{season_line_to_update.projected_wins} projected wins!"
  #   end

  # end
end