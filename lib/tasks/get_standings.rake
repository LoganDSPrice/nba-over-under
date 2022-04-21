desc "fetch and update current nba standings"
task :update_nba_standings => :environment do
  StandingsUpdater.run
end