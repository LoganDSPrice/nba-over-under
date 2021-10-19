# == Schema Information
#
# Table name: locks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pick_id    :bigint
#
# Indexes
#
#  index_locks_on_pick_id  (pick_id)
#
# Foreign Keys
#
#  fk_rails_...  (pick_id => picks.id)
#
class Lock < ApplicationRecord
  model_name.instance_variable_set(:@route_key, 'lock')
  
  attr_accessor :should_create

  belongs_to :pick, touch: true
  has_one  :enrollment, through: :pick

  validate :locks_count_within_limit, on: :create

  def locks_count_within_limit
    if enrollment.locks.count >= AppSetting.first.locks_limit
      errors.add(:base, 'Exceeded locks limit')
    end
  end
end
