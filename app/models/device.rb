class Device < ActiveRecord::Base
	
	self.table_name = 'devices'
	self.primary_key = 'id'
	
	has_many :positions
	has_one :user
	has_many :users_devices
	
	
	#fkp latestPosition_id	
	
end
