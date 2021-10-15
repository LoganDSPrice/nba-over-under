class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :season
  has_many  :picks, dependent: :destroy
  has_many :locks, through: :picks
end
