# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  city       :string
#  conference :string
#  division   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  nba_id     :string
#

class Team < ApplicationRecord
  has_many  :season_lines, dependent: :destroy
  has_many :picks, through: :season_lines

end
