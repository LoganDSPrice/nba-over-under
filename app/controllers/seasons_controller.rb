class SeasonsController < ApplicationController

  def show_active_season
    @enrollments = active_season.enrollments.includes(:user, :picks).joins(:user, :picks).merge(Pick.limit(10).order(:id))
    @season_lines = active_season.season_lines.includes(:team, :picks).order("team.city asc")

    render "show"
  end

  def show
    
  end
  
  def new
    @season = Season.new
  end

  def create
    @season = Season.new(season_params)
    if @season.save
      redirect_to action: :index
    else
      render :new
    end
  end
  
  def index
    @seasons = Season.all
  end

  private
  
  def season_params
    @season_params ||= params.require(:season).permit(:year)
  end
end