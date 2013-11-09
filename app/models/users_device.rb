class UsersDevice < ActiveRecord::Base
	self.table_name = 'users_devices'
	belongs_to :user
	belongs_to :device
	#fkp users_id
	#fkp devices_id
	
end
