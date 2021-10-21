# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  season_id  :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_enrollments_on_season_id              (season_id)
#  index_enrollments_on_user_id                (user_id)
#  index_enrollments_on_user_id_and_season_id  (user_id,season_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (season_id => seasons.id)
#  fk_rails_...  (user_id => users.id)
#
class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :season
  has_many :season_lines, through: :season
  has_many  :picks, dependent: :destroy
  has_many :locks, through: :picks
  has_one :draft, through: :season
  has_one :draft_active_in, class_name: "Draft", foreign_key: :active_drafter_id
  
  validates_uniqueness_of :user, scope: :season

  after_create :create_picks


  def create_picks
    season.season_lines.each do |season_line|
      picks.create(season_line: season_line)
    end
  end
end
