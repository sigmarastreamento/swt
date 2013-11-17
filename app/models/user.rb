class User < ActiveRecord::Base
  has_many :devices
  belongs_to :user_setting
  has_many :users_device
	
  rolify
	
	#set_table_name 'users'
	#set_primary_key 'id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #attr_accessible :last_positions

  def last_positions
      sql = "select users_devices.users_id as 'id', 
                users.email as 'email', positions.altitude as 'altitude', 
                positions.latitude as 'latitude', 
                positions.longitude as 'longitude'  
             from   users_devices, 
                users, 
                devices, 
                positions 
             where  users_devices.users_id = #{self.id} 
             and  users.id = users_devices.users_id and devices.id = users_devices.devices_id 
             and  positions.id = devices.latestposition_id;"

      ActiveRecord::Base.connection.execute(sql)
  end
	
	#fkp userSettings_id
end
