# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  season_id  :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_enrollments_on_season_id              (season_id)
#  index_enrollments_on_user_id                (user_id)
#  index_enrollments_on_user_id_and_season_id  (user_id,season_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (season_id => seasons.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class EnrollmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
