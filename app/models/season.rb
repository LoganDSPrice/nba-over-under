class Season < ApplicationRecord
  has_many  :enrollments, dependent: :destroy
  has_many  :season_lines, dependent: :destroy
  has_many :enrolled_users, through: :enrollments, source: :user
  has_many :picks, through: :enrollments
  has_many :locks, through: :picks

  validates_uniqueness_of :year
end
