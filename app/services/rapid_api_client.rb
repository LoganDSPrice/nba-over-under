class RapidApiClient
  # include HTTParty
  # base_uri "https://api-nba-v1.p.rapidapi.com"
  # MAX_RETRIES = 5

  # def get_standings(season: "2022")
  #   times_retried = 0

  #   begin
  #     query = {
  #       league: "standard",
  #       season: "2022"
  #     }
  #     response = self.class.get(
  #       "/standings",
  #       query: query,
  #       headers: headers,
  #       timeout: 60
  #     )
  #   rescue Net::ReadTimeout => error
  #     if times_retried < MAX_RETRIES
  #       times_retried += 1
  #       puts "Failed to fetch standings, retry #{times_retried}/#{MAX_RETRIES}"
  #       retry
  #     else
  #       puts "Exiting script."
  #       exit(1)
  #     end
  #   end

  #   # current_team_standings = response["response"]

  #   # current_team_standings.each do |team|
  #   #   nba_team = Team.find_by(nba_id: team.dig("team", "id"))
  #   #   season_line_to_update = SeasonLine.find_by(team: nba_team, season: Season.active_season)

  #   #   season_line_to_update.update(
  #   #     projected_wins: (team["winPct"].to_f * 82),
  #   #     wins: team["win"],
  #   #     losses: team["loss"],
  #   #   )
  #   #   puts "#{nba_team.name} updated with #{season_line_to_update.projected_wins} projected wins!"
  #   # end
  #   response
  # end

  # protected

  # def headers
  #   {
  #     "X-RapidAPI-Host": "api-nba-v1.p.rapidapi.com",
  #     "X-RapidAPI-Key": "1f7e92a9c7mshea107c9b255c98fp141df7jsn9f7bcf08ce84"
  #   }
  # end
  
end