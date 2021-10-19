class AllPicksController < ApplicationController
  def show
    @enrollments = active_season.enrollments.includes(:user).joins(:user).merge(User.order(:name))
    @season_lines = active_season.season_lines.includes(:team, :picks)

  end
end