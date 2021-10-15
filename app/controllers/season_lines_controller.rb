class SeasonLinesController < ApplicationController
  def index
    @season = Season.find(params[:season_id])
    @season_lines = @season.season_lines.joins(:team).merge(Team.order(:name))

    season_lines_by_conference = @season_lines.group_by {|season_line| season_line.team.conference }
    @season_lines_by_division = season_lines_by_conference.transform_values { |conference_season_lines| conference_season_lines.group_by { |season_line| season_line.team.division } }
  end
end