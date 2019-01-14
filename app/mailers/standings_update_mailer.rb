class StandingsUpdateMailer < ApplicationMailer
  def send_update_mailer
    contestant_emails = Contestant.all.pluck(:email)
    @standings_hash = {}
    Contestant.each do |contestant|
      contestant.pick.each do |pick|
        if pick.correct && pick.lock
          @standings_hash[contestant.name][pick.team.name] = 2
        elsif pick.correct
          @standings_hash[contestant.name][pick.team.name] = 1
        else
          @standings_hash[contestant.name][pick.team.name] = 0
        end
      end
    end

    mail to: contestant_emails, subject: "NBA Over/Under Standings Update - #{Date.today.strftime("%B %d")}"
  end
end
