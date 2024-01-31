module CsvSeasonLineImporter
  def self.import_csv(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      active_season_exists = !!Season.active_season
      team = Team.find_by_name(row['Name'])
      season = Season.find_or_create_by(year: row['Season']) do |season|
        season.active = !active_season_exists
      end
      
      season_line = SeasonLine.find_or_initialize_by(season: season, team: team) 
  
      if season_line.line.nil?
        season_line.update(line: row['Line'])
      end
    end
  end
end