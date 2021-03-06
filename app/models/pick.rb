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
      lock ? 2 : 1
    elsif !over && !team.over?
      lock ? 2 : 1
    elsif lock
      -1
    else
      0
    end
  end

  def correct?
    over && team.over? || !over && !team.over?
  end

  def team_name
    team.name
  end

  def team_city
    team.city
  end
end
