# Preview all emails at http://localhost:3000/rails/mailers/nba_mailer
class NbaMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    parsed = JSON.parse(File.read("standings_all.json"))
    standings = parsed["league"]["standard"]["teams"]

    beat_the_line_hash = {}

    standings.each do |t|
      team = Team.find_by(nba_id: t["teamId"])
      beat_the_line_hash[team] = ( (t["winPct"].to_f * 82) > team.line )
    end

    all_picks = Pick.all
    pick_result_hash = {}

    all_picks.each do |pick|
      if pick.over && beat_the_line_hash[pick.team]
        pick_result_hash[pick] = "Correct"
      else
        pick_result_hash[pick] = "Incorrect"
      end
    end

    NbaMailer.send_scoring_update(Contestant.find(2), pick_result_hash)
  end
end
