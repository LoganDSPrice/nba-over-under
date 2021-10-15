class Lock < ApplicationRecord
  belongs_to :pick
  has_one  :enrollment, through: :pick

  validate :locks_count_within_limit, on: :create

  def locks_count_within_limit
    if enrollment.locks.count >= AppSetting.first.locks_limit
      errors.add(:base, 'Exceeded locks limit')
    end
  end
end
