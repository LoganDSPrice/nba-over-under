desc 'send update email'
task :send_update_email, [:emails] => :environment do |_task, args|
  Rake::Task[:update_standings].invoke

  if Date.today.strftime('%A') == ENV['EMAIL_DAY']
    StandingsUpdateMailer.send_update_mailer(args[:emails]).deliver
  end
end