class MyPicksController < ApplicationController

  def show
    @picks = current_enrollment.picks.includes(:season_line, :team).joins(:team).merge(Team.order(name: :asc))

    teams_by_conference = Team.all.group_by { |team| team.conference }
    @teams_by_division = teams_by_conference.transform_values { |teams| teams.group_by { |team| team.division } }
  end
end