class SeasonLine < ApplicationRecord
  belongs_to :team
  belongs_to :season
  has_many  :picks, dependent: :destroy
end
