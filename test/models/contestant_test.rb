# == Schema Information
#
# Table name: contestants
#
#  id         :bigint(8)        not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ContestantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
