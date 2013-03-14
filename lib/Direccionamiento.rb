#encoding: UTF-8

require 'IP'

class Direccionamiento

	attr_accessor :ip, :netmask, :red

	def initialize(ip, netmask)
		@ip = IP.new(ip)					# Cada elemento del array es un octeto
		@netmask = IP.new(netmask)	
	end

	def to_s
		tos = ""
		if (@ip.to_s != "0.0.0.0")
			tos << "\tDirección IP:            " + @ip.to_s + "\n"
		end
		if (@netmask.is_netmask?)
			tos << "\tMáscara de subred:       " + @netmask.to_s + "\n"
			tos << "\tTamaño Prefijo:          " + "/" + @netmask.prefix.to_s + "\n"
			tos << "\tNúmero subred:           " + @netmask.subnet.to_s + "\n"
			tos << "\tNúmero Host:             " + (@netmask.subnet - 2).to_s + "\n" 
			if (@ip.to_s != "0.0.0.0")
				tos << "\tDirección de Red:        " + net + "\n"
				tos << "\tDirección de Broadcast:  " + broadcast + "\n"
			end
		else
			tos << "\tLa Máscara introducida no es correcta." + "\n"
		end
		return tos
	end

	def net
		result = (@netmask.ip[0].to_i & @ip.ip[0].to_i).to_s + "."
		result << (@netmask.ip[1].to_i & @ip.ip[1].to_i).to_s + "."
		result << (@netmask.ip[2].to_i & @ip.ip[2].to_i).to_s + "."
		result << (@netmask.ip[3].to_i & @ip.ip[3].to_i).to_s
	end

	def broadcast
		result = ( (@netmask.ip[0].to_i & @ip.ip[0].to_i) + (255 - @netmask.ip[0].to_i) ).to_s + "."
		result << ( (@netmask.ip[1].to_i & @ip.ip[1].to_i)  + (255 - @netmask.ip[1].to_i) ).to_s + "."
		result << ( (@netmask.ip[2].to_i & @ip.ip[2].to_i)  + (255 - @netmask.ip[2].to_i) ).to_s + "."
		result << ( (@netmask.ip[3].to_i & @ip.ip[3].to_i)  + (255 - @netmask.ip[3].to_i) ).to_s
	end

	def equal_subnet? (ip)
		result = false
		if ( (self.net == ip.net) && (self.broadcast == ip.broadcast) )
			result = true
		end
		result
	end

end
