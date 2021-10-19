module ApplicationHelper
  def active_season
    @active_season ||= Season.active_season
  end
end
