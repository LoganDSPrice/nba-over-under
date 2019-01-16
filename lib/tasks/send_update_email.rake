desc "send update email"
task :send_update_email => :environment do
  Rake::Task[:update_nba_standings].invoke

  StandingsUpdateMailer.send_update_mailer.deliver
end