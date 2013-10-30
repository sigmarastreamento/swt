class Position < ActiveRecord::Base
	set_table_name 'positions'
	set_primary_key 'id'
	
	#fkp device_id
end
