class LeaguesController < ApplicationController
  def latest_league
    @league = current_enrollment.league
    @enrollments = @league.enrollments.includes(:user, :picks).joins(:user, :picks).merge(Pick.limit(10).order(:id))
    @season_lines = @league.season.season_lines.includes(:team, :picks).order('team.city asc')

    render :show
  end

end
