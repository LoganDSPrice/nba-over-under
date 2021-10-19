# == Schema Information
#
# Table name: season_lines
#
#  id             :bigint           not null, primary key
#  line           :float
#  projected_wins :float            default(41.0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  season_id      :bigint
#  team_id        :bigint
#
# Indexes
#
#  index_season_lines_on_season_id              (season_id)
#  index_season_lines_on_team_id                (team_id)
#  index_season_lines_on_team_id_and_season_id  (team_id,season_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (season_id => seasons.id)
#  fk_rails_...  (team_id => teams.id)
#
class SeasonLine < ApplicationRecord
  belongs_to :team
  belongs_to :season
  has_many :picks, dependent: :destroy

  validates_uniqueness_of :team, scope: :season


  def over?
    projected_wins > line
  end
end
