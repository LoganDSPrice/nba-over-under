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

end
