class PicksController < ApplicationController
  before_action :set_pick, only: :update

  def index
    @user = User.find_by_email("logandsprice@gmail.com")
    @picks = @user.picks.includes(:season_line, :team).joins(:team).merge(Team.order(name: :asc))

    teams_by_conference = Team.all.group_by { |team| team.conference }
    @teams_by_division = teams_by_conference.transform_values { |teams| teams.group_by { |team| team.division } }
  end

  def update
    # error clause for if it fails to update
    
    @pick.reload unless @pick.update(pick_params)

    
  end

  private

  def set_pick
    @pick = Pick.find(params[:id])
  end
  
  def pick_params
    @pick_params ||= params.require(:pick).permit!
  end
end