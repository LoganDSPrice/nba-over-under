module SessionsHelper
  
  def current_enrollment
    session[:current_enrollment_id] ||= Enrollment.find_by(season: Season.active_season, user: current_user).id
    @current_enrollment ||= Enrollment.find_by_id(session[:current_enrollment_id])
  end
end
