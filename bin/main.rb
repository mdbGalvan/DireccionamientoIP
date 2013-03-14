#encoding: UTF-8

require 'IP'
require 'Direccionamiento'

option = "1"

while ( option != "0" ) do
	%x{clear}
	puts "\t*************************************************"
	puts "                        Menu"
	puts "\t*************************************************"
	puts "\t  1. Tamaño prefijo, Numero direcciones en la "
	puts "\t     subred y asignables a host."
	puts "\t  2. Dos IP pertenecen a la misma subred."
	puts "\t  3. CIDR"
	puts "\t  4. Dirección de Red y Broadcast."
	puts "\t  0. Salir"
	puts "\t*************************************************"
	print "\t   Opciones: "
	STDOUT.flush  
	option = gets.chomp
	puts "\n"
	case option
		when "1"
			print "\tMáscara:       "
			netmask_out = gets.chomp
			puts "\n\n"

			ip = Direccionamiento.new("0.0.0.0", netmask_out)

			puts ip
		when "2"
			print "\tDirección IP:  "
			STDOUT.flush  
			ip_out = gets.chomp  
			print "\tDirección IP2: "  
			ip_out2 = gets.chomp  
			print "\tMáscara:       " 
			netmask_out = gets.chomp
			puts "\n\n"

			ip1 = Direccionamiento.new(ip_out, netmask_out)
			ip2 = Direccionamiento.new(ip_out2, netmask_out)

			print "\n\t¿Las dos ip's pertenecen a la misma subred? " 
			puts ip1.equal_subnet? ip2
			puts "\tEl motivo se puede observar en la siguiente tabla:\n\n"
			puts ip1
			puts "\n"
			puts ip2
		when "3"
			puts "\tNo hace falta añadir en el ISP y subred la barra /.\n\n"
			print "\tRango de direcciones ISP:(/xx) "
			STDOUT.flush  
			isp = gets.chomp
			print "\tMáscara de subred:             "
			STDOUT.flush 
			 
			mask_subnet = gets.chomp
			subnet = 2 ** (mask_subnet.to_i - isp.to_i)
			puts "\n\tNúmero de subredes:            " + subnet.to_s
			host = 2 ** (32 - mask_subnet.to_i) - 2
			puts "\tNúmero de hosts/subred:        " + host.to_s
		when "4"
			print "\tDirección IP:  "
			STDOUT.flush  
			ip_out = gets.chomp   
			print "\tMáscara:       " 
			netmask_out = gets.chomp
			puts "\n\n"

			ip1 = Direccionamiento.new(ip_out, netmask_out)

			puts ip1
		when "0"
			puts "\n\n"
			puts "\tEsperemos haberle ayudado...\n\n"
	end
	puts "\n\n\n"

	sleep(3)
end