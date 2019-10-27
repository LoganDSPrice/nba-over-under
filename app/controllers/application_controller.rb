class ApplicationController < ActionController::Base
  def index
    @last_updated = Team.first.updated_at.strftime("Last updated at %H:%M on %m/%d")
    @teams = Team.all.sort_by { |team| team.city }
    @picks = Pick.all.sort_by { |pick| [pick.team_city, pick.contestant.id] }.group_by { |pick| pick.team_name }
    @contestant_names = Contestant.all.pluck(:name)

    render "/index.html.erb"
  end
end
