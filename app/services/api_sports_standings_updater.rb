module ApiSportsStandingsUpdater
  class StandingsSet
    attr_accessor :standings, :team_standings

    def initialize(standings)
      @standings = standings
      @team_standings = []

      build_team_standings
    end

    def update_team_records
      team_standings.each do |ts|
        ts.team.update(wins: ts.wins, losses: ts.losses, projected_wins: ts.calculate_projected_wins)
      end
    end
    
    private
    
    def build_team_standings
      standings.each do |team_standing_hash|
        team_standing = TeamStanding.new(team_standing_hash.with_indifferent_access)
        team_standings << team_standing unless team_standings.any? { |ts| team_standing.team_name == ts.team_name }
      end
    end
  end

  class TeamStanding
    attr_accessor :team_standing_hash, :team_name

    def initialize(team_standing_hash)
      @team_standing_hash = team_standing_hash
      @team_name = team_standing_hash.dig(:team, :name)
    end

    def team
      @team ||= (Team.find_by("CONCAT(CITY, ' ', NAME) LIKE ?", team_name) || (Team.find_by_name("Clippers") if team_name == "Los Angeles Clippers"))
    end

    def wins
      team_standing_hash.dig(:games, :win, :total)
    end

    def losses
      team_standing_hash.dig(:games, :lose, :total)
    end
  end
  
  def self.run(years_of_season: "2022-2023")
    client = ApiSportsClient.new
    @standings_set = StandingsSet.new(client.get_standings(years_of_season: years_of_season))

    @season = Season.find_by_year(years_of_season.last(4))
    
    self.update_team_records
  end
  
  private
  
  def self.update_team_records
    @standings_set.team_standings.each do |ts|
      season_line = SeasonLine.find_by(season: @season, team: ts.team)
      season_line.assign_attributes(wins: ts.wins, losses: ts.losses)
      season_line.projected_wins = season_line.calculate_projected_wins
      
      if season_line.save
        puts "#{ts.team.name} updated with #{season_line.projected_wins} projected wins!"
      end
    end
  end

end