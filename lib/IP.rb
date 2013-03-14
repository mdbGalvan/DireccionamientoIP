#encoding: UTF-8

class IP

	$values = [0, 128, 192, 224, 240, 248, 252, 254, 255]

	attr_accessor :ip

	def initialize(ip = "127.0.0.0")
		@ip = ip.scan /\d+/ 			# Cada elemento es un octeto
	end

	def to_s
		@ip[0] + '.' + @ip[1] + '.' + @ip[2] + '.' + @ip[3]
	end

	def is_netmask?
		i = 0
		j = 0
		zero = false
		result = true
		while ( ( i < @ip.size) && ( result ) ) do
			if ( !zero )
				j = 0
				while ( ( @ip[i] != $values[j].to_s ) && ( j < $values.size ) ) do
					j = j + 1
				end
				if ( j < 8 )
					zero = true
				elsif ( j == 9 )
					result = false
				end
			else
				if ( @ip[i] != $values[0].to_s )
					result = false
				end
			end
			i = i + 1
		end
		result
	end

	/Este método suma el nº de 1 que contiene la máscara en cada octeto/
	def prefix
		if is_netmask?
			result = @ip[0].to_i.to_s(2).scan(/1/).size
			result += @ip[1].to_i.to_s(2).scan(/1/).size
			result += @ip[2].to_i.to_s(2).scan(/1/).size
			result += @ip[3].to_i.to_s(2).scan(/1/).size
		else
			"No es una máscara."
		end
	end

	def subnet
		if is_netmask?
			2 ** (32 - prefix)
		else
			"No es una máscara."
		end
	end

end