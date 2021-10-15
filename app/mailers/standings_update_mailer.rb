class StandingsUpdateMailer < ApplicationMailer
  def send_update_mailer(emails)
    picks_hash = {}
    User.eager_load(:picks).eager_load(:teams).all.each do |user|
      picks_hash[user.name] = {}

      user.picks.each do |pick|
        picks_hash[user.name][pick.team.name] = pick.score
      end
    end

    standings = {}
    picks_hash.each do |user, picks|
      standings[user] = picks.sum {|k,v| v }
    end

    @final_hash = {}
    @final_hash["picks"] = picks_hash
    @final_hash["standings"] = sort_standings(standings)

    emails.nil? ? emails = User.all.pluck(:email) : emails

    mail to: emails, subject: "NBA Over/Under Standings Update - #{Date.today.strftime("%B %d")}"

    puts "emails sent!"
  end

  def sort_standings(standings_hash)
    standings_hash.sort_by {|_key, value| value}.reverse.to_h
  end
end
