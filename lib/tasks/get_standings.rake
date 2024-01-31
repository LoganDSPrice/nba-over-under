desc 'fetch and update current nba standings'
task update_standings: :environment do
  # StandingsUpdater.run
  ApiSportsStandingsUpdater.run(years_of_season: Season.years_of_active_season)
end