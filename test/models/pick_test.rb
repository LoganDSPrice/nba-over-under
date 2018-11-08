# == Schema Information
#
# Table name: picks
#
#  id            :bigint(8)        not null, primary key
#  lock          :boolean
#  over          :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  contestant_id :integer
#  team_id       :integer
#

require 'test_helper'

class PickTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
