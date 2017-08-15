class Pokemon

	attr_accessor  :name, :type, :db, :id

	def initialize(attributes)
		@name = attributes[:name]
		@type = attributes[:type]
		@db = attributes[:db]
		@id = attributes[:id]
		# attributes.each do |key, value|
		# 	self.send(("#{key}="), (value))
		# end

	end

	def self.save(pokemon_name, pokemon_type, db)  # ==> gives id number to pokemon ????????? 
		sql = <<-SQL 
		INSERT INTO pokemon (name, type)
		VALUES (?, ?)
		SQL
		db.execute(sql, pokemon_name, pokemon_type)
	end

	def self.find(id, db)
		pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
		new_poke_hash = {
			name: pokemon_array[1],
			type: pokemon_array[2],
			id: pokemon_array[0]
		}
		new_pokemon = self.new(new_poke_hash)
	end

	

end
