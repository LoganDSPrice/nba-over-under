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
require 'test_helper'

class EnrollmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
