desc "send update email"
task :send_update_email, [:emails] => :environment do |task, args|
  Rake::Task[:update_nba_standings].invoke

  if Date.today.strftime("%A") == "Monday"
    StandingsUpdateMailer.send_update_mailer(args[:emails]).deliver
  end
end