desc 'Setup the 2022 season'
task setup_season: :environment do |_t, _args|
  StandingsUpdater.run
  CsvSeasonLineImporter.import_csv('2022_lines.csv')
  CsvSeasonPicksImporter.import_csv('2022_picks.csv')
  CsvSeasonLocksImporter.import_csv('2022_locks.csv')
end