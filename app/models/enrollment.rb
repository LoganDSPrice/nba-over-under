# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  league_id  :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_enrollments_on_league_id              (league_id)
#  index_enrollments_on_user_id                (user_id)
#  index_enrollments_on_user_id_and_league_id  (user_id,league_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (league_id => leagues.id)
#  fk_rails_...  (user_id => users.id)
#
class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_one :season, through: :league
  has_many :season_lines, through: :season
  has_many :picks, dependent: :destroy
  has_many :locks, through: :picks
  has_one :draft, through: :season
  has_one :draft_active_in, class_name: "Draft", foreign_key: :active_drafter_id
  
  validates_uniqueness_of :user, scope: :league

  # after_create :create_picks


  def create_picks # I don't like this. I don't remember why I decided Picks should exist upon enrollment...
    season.season_lines.each do |season_line|
      picks.create(season_line: season_line)
    end
  end

  def season_score
    picks.includes(:season_line, :lock).map(&:score).sum
  end
end
