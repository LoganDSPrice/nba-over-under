# == Schema Information
#
# Table name: picks
#
#  id             :bigint           not null, primary key
#  over           :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  enrollment_id  :bigint
#  season_line_id :bigint
#
# Indexes
#
#  index_picks_on_enrollment_id                     (enrollment_id)
#  index_picks_on_season_line_id                    (season_line_id)
#  index_picks_on_season_line_id_and_enrollment_id  (season_line_id,enrollment_id) UNIQUE
#

class Pick < ApplicationRecord
  has_many  :locks, dependent: :destroy
  belongs_to :enrollment
  belongs_to :season_line
  has_one  :season, through: :enrollment
  has_one  :team, through: :season_line
  has_one  :user, through: :enrollment

  validates_uniqueness_of :season_line, scope: :enrollment

  def score
    if over && team.over?
      lock ? 2 : 1
    elsif !over && !team.over?
      lock ? 2 : 1
    elsif lock
      -1
    else
      0
    end
  end

  def correct?
    over && team.over? || !over && !team.over?
  end

  def team_name
    team.name
  end

  def team_city
    team.city
  end
end
