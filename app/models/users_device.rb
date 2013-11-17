class UsersDevice < ActiveRecord::Base
	self.table_name = 'users_devices'
	self.primary_key = 'users_id'

	belongs_to :user
	has_many :devices
	#fkp :users_id
	#fkp :devices_id
	
end
