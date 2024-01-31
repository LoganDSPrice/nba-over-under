class DraftsController < ApplicationController
  before_action :setup_league
  def show
    @current_pick = @league.picks.where(over: nil).order(:id).first
  end

  private

  def setup_league
    @league = League.find(params[:league_id])
  end
end
