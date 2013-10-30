class Device < ActiveRecord::Base
	set_table_name 'devices'
	set_primary_key 'id'
	
	#fkp latestPosition_id
end
