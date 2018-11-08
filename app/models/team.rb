# == Schema Information
#
# Table name: teams
#
#  id         :bigint(8)        not null, primary key
#  city       :string
#  conference :string
#  division   :string
#  line       :float
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  nba_id     :string
#

class Team < ApplicationRecord
end
