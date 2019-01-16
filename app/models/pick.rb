# == Schema Information
#
# Table name: picks
#
#  id            :bigint(8)        not null, primary key
#  contestant_id :integer
#  team_id       :integer
#  over          :boolean
#  lock          :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Pick < ApplicationRecord
  belongs_to :contestant
  belongs_to :team

  def score
    if over && team.over?
      lock ? 4 : 3
    elsif !over && !team.over?
      lock ? 4 : 3
    elsif lock
      0
    else
      1
    end
  end
end
