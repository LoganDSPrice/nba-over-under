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
  has_many  :enrollments, dependent: :destroy
  has_many  :season_lines, dependent: :destroy
  has_one :draft, dependent: :destroy
  has_many :enrolled_users, through: :enrollments, source: :user
  has_many :picks, through: :enrollments
  has_many :locks, through: :picks

  validates_presence_of :year
  validates_uniqueness_of :year
  validate :single_active_season?, on: :create

  after_create :create_season_lines
  after_create :create_draft

  def create_season_lines
    Team.all.each { |team| season_lines.create(team: team)}
  end

  def single_active_season?
    return unless active?
    
    if Season.where(active: true).count >=1
      errors.add(:active, "Another season is already active")
    end
  end

  def self.active_season
    @@active_season ||= find_by_active(true)
  end

end
