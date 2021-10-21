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
require "test_helper"

class DraftTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
