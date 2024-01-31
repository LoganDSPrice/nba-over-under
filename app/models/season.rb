# == Schema Information
#
# Table name: seasons
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(FALSE)
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Season < ApplicationRecord
  has_many :leagues
  has_many  :enrollments, through: :leagues
  has_many  :season_lines, dependent: :destroy
  has_many :enrolled_users, through: :enrollments, source: :user
  has_many :picks, through: :enrollments
  has_many :locks, through: :picks

  validates_presence_of :year
  validates_uniqueness_of :year
  validate :single_active_season?

  after_create :create_season_lines

  def create_season_lines
    Team.all.each { |team| season_lines.create(team: team)}
  end

  def single_active_season?
    return unless active?
    
    return unless Season.where(active: true).count >= 1
    errors.add(:active, 'Another season is already active')
    
  end

  def self.active_season
    @@active_season ||= find_by_active(true)
  end

  def self.years_of_active_season
    "#{active_season.year - 1}-#{active_season.year}"
  end

  # def self.setup_new_season(user_emails=User.all.pluck(:email), year:)
  #   ActiveRecord::Base.transaction do
  #     Season.active_season&.update(active: false)
  #     new_season = Season.create(year: year)
  
  #     User.where(email: user_emails).each {|user| user.enroll_for_season(new_season)}
  #   end
  # end

end
