class UserSetting < ActiveRecord::Base
	self.table_name = 'user_settings'
	self.primary_key = 'id'
	
	has_one :user
end
