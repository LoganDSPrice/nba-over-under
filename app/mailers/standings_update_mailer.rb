class StandingsUpdateMailer < ApplicationMailer
  def send_update_mailer
    contestant_emails = "pavan.sarguru@gmail.com"
    @standings_hash = {}
    Contestant.eager_load(:picks).eager_load(:teams).all.each do |contestant|
      @standings_hash[contestant.name] = {}

      contestant.picks.each do |pick|
        @standings_hash[contestant.name][pick.team.name] = pick.score
      end
    end

    mail to: contest  ant_emails, subject: "NBA Over/Under Standings Update - #{Date.today.strftime("%B %d")}"
  end
end
