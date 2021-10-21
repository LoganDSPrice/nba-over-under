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
  has_one :lock, dependent: :destroy
  belongs_to :enrollment
  belongs_to :season_line
  has_one  :season, through: :enrollment
  has_one  :team, through: :season_line
  has_one  :user, through: :enrollment

  after_update :update_season_channel
  after_touch :update_season_channel

  validates_uniqueness_of :season_line, scope: :enrollment

  accepts_nested_attributes_for :lock

  def score
    if over == season_line.over?
      locked? ? 2 : 1
    elsif lock
      -2
    else
    -1
    end
  end

  def correct?
    return if over.nil?
    over && season_line.over? || !over && !season_line.over?
  end

  def team_name
    team.name
  end

  def team_city
    team.city
  end

  def locked?
    !lock.nil? && lock.persisted?
  end

  def update_season_channel
    pick = ApplicationController.render(
      partial: "picks/pick",
      locals: { pick: self }
    )
    ActionCable.server.broadcast "season_channel_#{season.id}", { pick: pick, pickId: self.id }
  end
end
