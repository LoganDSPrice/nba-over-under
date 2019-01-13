# == Schema Information
#
# Table name: teams
#
#  id             :bigint(8)        not null, primary key
#  nba_id         :string
#  city           :string
#  name           :string
#  conference     :string
#  division       :string
#  line           :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  projected_wins :float
#

class Team < ApplicationRecord
  has_many :picks
end
