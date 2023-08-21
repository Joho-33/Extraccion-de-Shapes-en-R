#Librerias necesarias
library(rgdal)
library(sf)
library(terra)
library(rgeos)
library(tidyverse)
library(sp)

#En caso de no tener librerias instaladas, usar el siguente comando en la consola: install.packages("Libreria_a_instalar")

#Leer el archivo shapefile del cual se van a extraer poligonos. Sustituir la ruta del archivo
shp_file <- readOGR("C:/AdaptarC+/Plantilla de mapa - AdaptarC+/1. Shapes/Subcuencas_CHA.shp")


#Datos generales del poligono. Visulaiza la tabla de atributos
head(shp_file@data)

#Visulaizar el poligonpo
plot(shp_file)

#Creacion de una lista con los valores de los poligonos a extraer. En este caso el Nombre del Campo SubCuenca. Se pretenden extraer solo 3
#Desde luego se pueden extraer muchos mas en funcion de la cantidad de poligonos que tenga el shp del cual se quiera extraer los de interes
poligonos_extraer <- c("Guacerique", "Del Hombre", "Yeguare")

#Bucle de extraccion de cada uno de los poligonos
for (valor in poligonos_extraer) {
  poligono_seleccionado <- shp_file[shp_file$SubCuenca == valor, ]
  # Crea el nombre del archivo Shapefile para guardar
  nombre_archivo <- paste(" ", valor, ".shp", sep = "")
  #Ruta a la carpeta donde deseas guardar los archivos. Sustituir la ruta del archivo
  ruta_guardado <- file.path("C:/AdaptarC+/Plantilla de mapa - AdaptarC+/1. Shapes/", nombre_archivo)
  #Guarda cada uno de los poligonos extraidos poligono
 writeOGR(poligono_seleccionado, ruta_guardado, layer = nombre_archivo, driver = "ESRI Shapefile")
}
#Revisar la carpeta de guardado, alli estaran los shapes que se decidieron extraer.

