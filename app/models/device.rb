class Device < ActiveRecord::Base
	self.table_name = 'devices'
	self.primary_key = 'id'
	
	#fkp latestPosition_id
end
