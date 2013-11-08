class Device < ActiveRecord::Base
	self.table_name = 'devices'
	self.primary_key = 'id'
	belongs_to :position
	
	#fkp latestPosition_id
end
