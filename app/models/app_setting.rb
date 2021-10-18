# == Schema Information
#
# Table name: app_settings
#
#  id          :bigint           not null, primary key
#  locks_limit :integer          default(3)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class AppSetting < ApplicationRecord
end
