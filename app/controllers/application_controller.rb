class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :authenticate_user!


  def index
    @last_updated = Team.first.updated_at.in_time_zone("Central Time (US & Canada)").strftime("Last updated at %H:%M on %m/%d")
    @teams = Team.all.sort_by { |team| team.city }
    @user_names = User.all.pluck(:name)

    all_picks = Pick.includes(:team, :user).all.sort_by { |pick| [pick.team_city, pick.user.id] }
    @picks = all_picks.group_by { |pick| pick.team_name }
    @standings = build_standings(all_picks)

    render "/index.html.erb"
  end


  private

  def build_standings(picks)
    grouped_picks = picks.group_by { |pick| pick.user.name }

    standings = grouped_picks.each do |name, picks|
      grouped_picks[name] = picks.inject(0){|sum, x| sum + x.score}
    end

    standings.sort_by {|_key, score| score}.reverse.to_h
  end

  def authenticate_active_admin_user!
    puts "*"*60
    puts "authenticate_active_admin_user!"
    puts "*"*60
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end

  
end
