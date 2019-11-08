class StandingsUpdateMailer < ApplicationMailer
  def send_update_mailer(emails)
    picks_hash = {}
    Contestant.eager_load(:picks).eager_load(:teams).all.each do |contestant|
      picks_hash[contestant.name] = {}

      contestant.picks.each do |pick|
        picks_hash[contestant.name][pick.team.name] = pick.score
      end
    end

    standings = {}
    picks_hash.each do |contestant, picks|
      standings[contestant] = picks.sum {|k,v| v }
    end

    @final_hash = {}
    @final_hash["picks"] = picks_hash
    @final_hash["standings"] = sort_standings(standings)

    emails.nil? ? emails = Contestant.all.pluck(:email) : emails

    mail to: emails, subject: "NBA Over/Under Standings Update - #{Date.today.strftime("%B %d")}"

    puts "emails sent!"
  end

  def sort_standings(standings_hash)
    standings_hash.sort_by {|_key, value| value}.reverse.to_h
  end
end
