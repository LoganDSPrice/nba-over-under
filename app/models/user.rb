# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User <ApplicationRecord
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable
         
  has_many  :enrollments, dependent: :destroy
  has_many :enrolled_seasons, through: :enrollments, source: :season
  has_many :picks, through: :enrollments
end
