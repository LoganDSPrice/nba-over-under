class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :season
  has_many  :picks, dependent: :destroy
  has_many :locks, through: :picks

  validates_uniqueness_of :user, scope: :season

  after_create :create_picks


  def create_picks
    season.season_lines.each do |season_line|
      picks.create(season_line: season_line)
    end
  end
end
