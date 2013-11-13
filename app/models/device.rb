class Device < ActiveRecord::Base
	self.table_name = 'devices'
	self.primary_key = 'id'
	has_one :position
	has_one :user
	
	
	#fkp latestPosition_id	
	
	
end
