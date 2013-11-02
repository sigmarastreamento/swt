class Position < ActiveRecord::Base
	self.table_name = "positions"
	self.primary_key = "id"
	
	# metodo para não deixar o metodo valid do rails ser chamado
	# devido a tabela positions ter um campo | atributo chamado valid
	def self.instance_method_already_implemented?(method_name)
    	return true if method_name == 'valid'
    	return true if method_name == 'valid?'
    	super
	end
end
