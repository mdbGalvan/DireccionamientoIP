***
>**Autora:**         *María D. Batista Galván*  
>**Fecha:**          *Jueves 14 de Marzo de 2013*  
>**Asignatura:**     *Redes y Sistemas Distribuidos*  
>**Cuestionario:**  **Actividad 4: Direccionamiento IP**  
***

##Pasos

>En dicha asignatura se realizan una serie de cuestionarios (llamados actividades) cada cierto tiempo. Pues para este actividad he optado por realizarme este programa, para garantizar que los resultados son correctos
y no sufrido un error por causa del despiste.

##Actividad 4: Direccionamiento IP

>Arrancando el programa desde la raíz con **rake** (sólo existe una opción en el Rakefile), nos encontramos con varias opciones.

>* Se le pedirá la máscara de red, y el programa le calculará el tamaño del prefijo, el número direcciones en la subred y el número de direcciones asignables a host. Para contar con más detalle puede verse en la [wikipedia](http://es.wikipedia.org/wiki/Máscara_de_red).  
* Luego, se indica si dos direcciones IP pertenecen o no a la misma subred, utilizando la máscara de subred indicada.   
* Introduciéndole el rango de direcciones ISP, y diviendo este bloque en distintas subredes utilizando para ello la máscara de subred introducida, calcula el número de subredes y el número de hosts por subredes.
* Y por último, se calcula la dirección de red y broadcast, tras haberle introducido la dirección IP y la máscara de subred.

#Instrucciones

>Un ejemplo para introducir las IP's o máscaras de subred son: 255.255.192.0

#Posibles Mejoras

>En breve, se añadirá nuevos commits mejorando la opción 1 y 3. Como por ejemplo:

>* Introduciendo el tamaño del prefijo, se muestra la máscara de subred, número de direcciones en la subred y el número de direcciones asignables a hosts. Es decir, que no sólo se calcule con la máscara de subred, sino también con el tamaño del prefijo.
* Devolver estos 4 parámetros: rango de direcciones ISP, máscara de subred, número de subredes o número de hosts/subred, no sólo introduciéndole los dos primeros, sino con más combinaciones posibles.
