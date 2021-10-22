class StandingsUpdateMailer < ApplicationMailer
  def send_update_mailer(emails)
    picks_hash = {}
    Enrollment.includes(:picks, :season_lines, :user).each do |enrollment|
      picks_hash[enrollment.user.name] = {}

      enrollment.picks.each do |pick|
        picks_hash[enrollment.user.name][pick.team.name] = pick.score
      end
    end

    standings = {}
    picks_hash.each do |user, picks|
      standings[user] = picks.sum {|k,v| v }
    end

    @final_hash = {}
    @final_hash["picks"] = picks_hash
    @final_hash["standings"] = standings.sort_by {|_key, value| value}.reverse.to_h

    emails.nil? ? emails = User.all.pluck(:email) : emails

    mail to: emails, subject: "NBA Over/Under Standings Update - #{Date.today.strftime("%B %d")}"

    puts "emails sent!"
  end

  def sort_standings(standings_hash)
    standings_hash.sort_by {|_key, value| value}.reverse.to_h
  end
end
