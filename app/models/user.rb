class User < ActiveRecord::Base
  rolify
	
	#set_table_name 'users'
	#set_primary_key 'id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	
	#fkp userSettings_id
end
