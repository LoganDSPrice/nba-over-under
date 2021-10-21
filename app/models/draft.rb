# == Schema Information
#
# Table name: drafts
#
#  id                :bigint           not null, primary key
#  active            :boolean          default(FALSE)
#  draft_order       :jsonb
#  started_at        :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  active_drafter_id :integer
#  season_id         :bigint           not null
#
# Indexes
#
#  index_drafts_on_season_id  (season_id)
#
# Foreign Keys
#
#  fk_rails_...  (season_id => seasons.id)
#
class Draft < ApplicationRecord
  belongs_to :season
  belongs_to :active_enrollment, class_name: "Enrollment", primary_key: :active_drafter_id, optional: true

  has_many :enrollments, through: :season

  def start!
    # update active: true,


  end
end
