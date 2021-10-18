# == Schema Information
#
# Table name: locks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pick_id    :bigint
#
# Indexes
#
#  index_locks_on_pick_id  (pick_id)
#
# Foreign Keys
#
#  fk_rails_...  (pick_id => picks.id)
#
require 'test_helper'

class LockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
