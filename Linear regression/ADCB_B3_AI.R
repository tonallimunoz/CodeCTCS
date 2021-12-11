#Instalar tidyverse, boot, car, QuantPsyc, ggplot2, dplyr
install.packages("tidyverse")
install.packages("boot")
install.packages("car")
install.packages("QuantPsyc")
install.packages("ggplot2")
install.packages("dplyr")
#Cargar librerias
library(tidyverse)
library(boot)
library(car)
library(QuantPsyc)
library(ggplot2)
#Importar base de datos
library(readxl)
Datos <- read_excel("Datos.xlsx", sheet = "Datos", 
                    +     col_types = c("numeric", "numeric", "numeric", 
                                        +         "numeric", "numeric", "numeric"))
View(Datos)
DatosTransformados <- read_excel("DatosTransformados.xlsx", 
                                 col_types = c("numeric", "numeric", "numeric", 
                                               "numeric", "numeric", "numeric"))
View(DatosTransformados)
#Ver los nombres de las variables
names(Datos)
names(DatosTransformados)
#Instalar pastecs
install.packages("pastecs")
#Cargar libreria pastecs
library(pastecs)
#Estad�sticas descriptivas
stat.desc(Datos)
#Comprobar el tipo de variable
str(Datos)
#Ruta que sigue R para buscar objetos
attach(Datos)
attach(DatosTransformados)
#Gr�ficos de dispersi�n
plot(Sup,Prod)
plot(Temp,Prod)
plot(Precip, Prod)
plot(Pob,Prod)
## Se quiere conocer el tipo de distribución que tiene cada variable
#Instalar psych
install.packages("psych")
library(psych)
multi.hist(x = Prod, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
multi.hist(x = Prodln, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
multi.hist(x = Sup, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
multi.hist(x = Supln, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
multi.hist(x = Temp, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
multi.hist(x = Templn, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
multi.hist(x = Precip, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
multi.hist(x = Precipln, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
multi.hist(x = Pob, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
multi.hist(x = Pobln, dcol = c("blue", "red"), dlty = c("dotted", "solid"),
           main = "")
##Otros paquetes permiten representar los diagramas de dispersión, los valores de correlación para cada par de variables y la distribución de cada una de las variables.
#Instalar GGally
install.packages("GGally")
#Cargar libreria "GGally"
library(GGally)
ggpairs(Datos, lower = list(continuous = "smooth"),
        diag = list(continuous = "barDiag"), axisLabels = "none")
#Generar el modelo, hay diferentes formas de llegar al modelo final más adecuado. 
##En este caso se va a emplear el método mixto iniciando el modelo con todas las variables como predictores y realizando la selección de los mejores predictores con la medición Akaike(AIC).
#Modelo de regresión lineal múltiple
modelo <- lm(Prodln ~ Supln + Pobln, data = Datos)
summary(modelo)
modelo <- lm(Prodln ~ Precipln + Templn, data = Datos)
summary(modelo)