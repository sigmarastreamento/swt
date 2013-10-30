class Position < ActiveRecord::Base
	self.table_name = 'positions'
	self.primary_key = 'id'
	
	#fkp device_id
end
