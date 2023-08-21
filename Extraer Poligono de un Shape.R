#Librerias requeridas
library(rgdal)
library(sf)
library(terra)
library(rgeos)
library(tidyverse)
library(sp)

#En caso de no tener alguna libreria instalada, instalar desde la consola de R el siguiente comando: install.packages("nombre_de_la_libreria_a_instalar")

#Leer el archivo shape del cual se va a extraer un poligono. Sustituir la ruta de acceso al archivo .shp
shp <- readOGR("C:/Trabajos ArcGis/Shapes/Administrativos/departamentos.shp")

#Permite ver el contenido de la tabla de atributos de la cual se ve el campo de particular interes
head(shp@data)

#Visualizar el Shapefile 
plot(shp) 

# Filtrar el polígono que se desea extraer por Campo en este caso se llama DEPARTAMEN. Entre apostrofes el nombre del poligono a extraer
poligono <- subset(shp, DEPARTAMEN == 'Francisco Morazán')

#Visualizar el shapefile a extraer
plot(poligono)

#Guardar en carpeta el poligono seleccionado de interes. Sustituir la ruta en la que se desea guardar la extraccion del poligono .shp
writeOGR(poligono, dsn = "C:/Trabajos ArcGis/Shapes/Administrativos", layer = "fm", driver = "ESRI Shapefile")

#Listo! Ya tienes guardado la extraccion de un poligono .shp para ser trabajado luego en un SIG