class NbaMailer < ApplicationMailer
  default from: "Xanadu NBA Over/Under League <Xanadu.NBA@logandsprice.com>"

  def send_scoring_update(user, pick_hash)
    @user = user
    @pick_hash = pick_hash
    @teams = Team.all
    @scoreboard = {}

    Contestant.all.each do |contestant|
      @scoreboard[contestant] = 0
    end

    @pick_hash.each do |pick, value|
      if value == "Correct" && pick.lock
        @scoreboard[pick.contestant] += 4
      elsif value == "Correct"
        @scoreboard[pick.contestant] += 3
      elsif value == "Incorrect" && (pick.lock)
        @scoreboard[pick.contestant] += 0
      else
        @scoreboard[pick.contestant] += 1
      end
    end

    mail(to: @user.email, subject: 'League scoring update!')
  end
end
