# == Schema Information
#
# Table name: leagues
#
#  id                :bigint           not null, primary key
#  draft_order       :jsonb
#  drafting_enabled  :boolean          default(FALSE)
#  started_at        :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  active_drafter_id :integer
#  season_id         :bigint           not null
#
# Indexes
#
#  index_leagues_on_season_id  (season_id)
#
# Foreign Keys
#
#  fk_rails_...  (season_id => seasons.id)
#
class League < ApplicationRecord
  belongs_to :season
  belongs_to :active_enrollment, class_name: 'Enrollment', foreign_key: :active_drafter_id, optional: true

  has_many :enrollments
  has_many :picks, through: :enrollments

  def build_draft!
    shuffled_enrollments = enrollments.shuffle
    season_lines = season.season_lines.includes(:team).order('teams.city asc')

    draft_round_number = 1
    season_lines.each do |season_line|
      enrollments_ordered_for_round = draft_round_number.odd? ? shuffled_enrollments : shuffled_enrollments.reverse
      enrollments_ordered_for_round.each do |enrollment|
        Pick.create(season_line: season_line, enrollment: enrollment)
      end
      draft_round_number += 1
    end
  end
  
  def start!
    # update active: true,

  end
end
