#Librerias requeridas
library(rgdal)
library(sf)
library(terra)
library(rgeos)
library(tidyverse)
library(sp)

#En caso de no tener alguna libreria instalada, instalar desde la consola de R el siguiente comando: install.packages("nombre_de_la_libreria_a_instalar")

#Leer el archivo shape del cual se va a extraer un poligono
shp <- readOGR("C:/Trabajos ArcGis/Shapes/Administrativos/departamentos.shp")

#Permite ver el contenido de la tabala de atributos de la cual se ve el campo de particular interes
head(shp@data)
#Grafica el Shapefile 
plot(shp) 

# Filtrar el polígono que se desea extraer por Campo en este caso se llama DEPARTAMEN
poligono <- subset(shp, DEPARTAMEN == 'Francisco Morazán')
plot(poligono)

#Guardar en carpeta el poligono seleccionado de inters
writeOGR(poligono, dsn = "C:/Trabajos ArcGis/Shapes/Administrativos", layer = "fm", driver = "ESRI Shapefile")
