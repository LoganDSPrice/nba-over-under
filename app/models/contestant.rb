# == Schema Information
#
# Table name: contestants
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contestant <ApplicationRecord
  has_many :picks
end
