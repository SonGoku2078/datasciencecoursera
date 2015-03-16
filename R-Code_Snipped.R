########################################################################################################
#########
###
#                        W E E K   1 - Programming with R
###
########
########################################################################################################
#
# Topics :

data <- read.csv("hw1_data.csv")
data

#
# damit wird die 1.Spalte angezeigt
data[1]

# damit werden NUR die ersten beiden Zeilen angezeigt
data2Rows <- read.csv("hw1_data.csv",nrow=2)
data2Rows
# Folgendes Ergenis wird erzeugt:
#  Ozone Solar.R Wind Temp Month Day
#1    41     190  7.4   67     5   1
#2    36     118  8.0   72     5   2

# damit werden NUR die letzten beiden Zeilen angezeigt
dataSkipRows <- read.csv("hw1_data.csv",skip=152)
dataSkipRows
#   X18 X131   X8 X76 X9 X29
# 1  20  223 11.5  68  9  30

#-------------------------------------------------------------------------
# damit wird der Wert aus der Zeile 47 und der 1.Spalte angezeigt.
data <- read.csv("hw1_data.csv")
data[47,1]            # ansprechen der indexe via "Row Nr., Column Nr."
data[47,"Ozone"]      # ansprechen der indexe via "Row Nr., Column Name"
# Resultat :
# > data[47,1]
# [1] 21
# > data[47,"Ozone"]
# [1] 21
#

#-------------------------------------------------------------------------
# Hier werden NA (fehlende Werte) rausgefiltert.
data <- read.csv("hw1_data.csv")
good_data <- complete.cases(data) # Damit werden alle NA Werte mit "False" markiert
data[good_data,]                  # so werden nur die True werte angezeigt

#-------------------------------------------------------------------------
# Die 1.Spalte (mit den rausgefilternten NA-Werten) darstellen
dataCleaned <- data[good_data,]
y <- dataCleaned[1]
y
#    Ozone
#1      41
#2      36
#3      12
#4      18
#7      23
# ........

#-------------------------------------------------------------------------
# Den mean berechnen aus der Spalte "Ozone" mittels sapply
sapply(y, mean)

# Resultat :
# > sapply(y, mean)
# Ozone 
# 42.0991

#-------------------------------------------------------------------------
# Zeigt die 6 zeilen einer Tabelle an bzw. in dem Fall nur die Spalte "Ozone"
head(x["Ozone"])

# > head(x["Ozone"])
# Ozone
# 1    41
# 2    36
# 3    12
# 4    18
# 7    23
# 8    19
#

#-------------------------------------------------------------------------
# Markieren aller Werte aus der Spalte "Ozone" welche >31 sind mit "TRUE/FALSE"
OzoneGT31L <- x["Ozone"] >31
OzoneGT31L
# Resultat :
#     Ozone
# 1    TRUE
# 2    TRUE
# 3   FALSE
# 4   FALSE
# 7   FALSE
# .........

#-------------------------------------------------------------------------
# die Effektiven realen Werte aus Spalte 1 "Ozone" rausfiltern aus der gesammten
# Tabelle (inkl. aller vorhanden Spalten)
x[OzoneGT31L,]
# Ozone Solar.R Wind Temp Month Day
# 1      41     190  7.4   67     5   1
# 2      36     118  8.0   72     5   2
# 17     34     307 12.0   66     5  17
# 24     32      92 12.0   61     5  24
# 29     45     252 14.9   81     5  29
# 30    115     223  5.7   79     5  30
# .........

#-------------------------------------------------------------------------
# Hier wird das selbe wie oben gemacht, nur auf die Spalte "Temp"
xOgt31 <- x[OzoneGT31L,]
TempGT90L <- xOgt31["Temp"] >90
TempGT90L

# 1   FALSE
# 2   FALSE
# 17  FALSE
# 24  FALSE
# 29  FALSE
# 30  FALSE
# 31  FALSE
# 40  FALSE
# 41  FALSE
# 48  FALSE
# 62  FALSE
# 63  FALSE
# 64  FALSE
# 66  FALSE 
# 67  FALSE
# 68  FALSE
# 69   TRUE
# 70   TRUE

#-------------------------------------------------------------------------
# Hier wird die gesammte Tabelle angezeigt, jedoch werden die Zeilen raus
# gefiltert bei welchen die Temp > 90 ist. Alle Spalten werden angezeigt
TempGT90 <- xOgt31[TempGT90L,]

# Resultat :
# Ozone Solar.R Wind Temp Month Day
# 69     97     267  6.3   92     7   8
# 70     97     272  5.7   92     7   9
# 120    76     203  9.7   97     8  28
# 121   118     225  2.3   94     8  29
# 122    84     237  6.3   96     8  30
# 123    85     188  6.3   94     8  31
# 124    96     167  6.9   91     9   1
# 125    78     197  5.1   92     9   2
# 126    73     183  2.8   93     9   3

#-------------------------------------------------------------------------
# Hier wird der Mean berechnet für Temp
sapply(TempGT90[2], mean)

# Resulat :
# Solar.R 
# 212.8 

#-------------------------------------------------------------------------
# Hier wird der MEAN der Temp von allen Monaten = 6 errechnet 
# Step 1 - den Monat 6 TRUE flaggen
MonthEQ6L <- dataCleaned["Month"] ==6        

# Step 2 - die TRUE Flags auf die DatenTabelle legen und die reallen daten rausfiltern
MonthEQ6  <- dataCleaned[MonthEQ6L,]  

# Step 3 - Ausgabe der gefilterten Werte
MonthEQ6

# Step 4 - Spalte "Temp" Extrahieren 
TempMonth6 <- MonthEQ6["Temp"]

# Step 5 - Mean ermitteln
sapply(TempMonth6, mean)

#-------------------------------------------------------------------------
# Hier wird der MAX Wert von Ozone von allen Monaten = 5 errechnet 
# Step 1 - den Monat 6 TRUE flaggen
MonthEQ5L <- dataCleaned["Month"] ==5        

# Step 2 - die TRUE Flags auf die DatenTabelle legen und die reallen daten rausfiltern
MonthEQ5  <- dataCleaned[MonthEQ5L,]  

# Step 3 - Ausgabe der gefilterten Werte
MonthEQ5

# Step 4 - Spalte "Temp" Extrahieren 
OzoneMonth5 <- MonthEQ5["Ozone"]

# Step 5 - Mean ermitteln
sapply(OzoneMonth5, max)

########################################################################################################
#########
###
#                        W E E K   2 - Programming with R
###
########
########################################################################################################
#
# Topics :
# + Control Structures:
#  - if-else  
#  - For loop
#  - nested For loops
#  - while loops
#  - Functions
#
#

#-------------------------------------------------------------------------
# Gewöhnlicher For-Loop welcher die werte 1-10 raus puttet
for(i in 1:10) {
        print(i)
} 

#-------------------------------------------------------------------------
# nested For-Loop welcher eine Matrix raus puttet
x <- matrix(1:6,2,3)
for (i in seq_len(nrow(x))) {
        for (j in seq_len(ncol(x))) {
                print(x[i,j])
        }
}

#-------------------------------------------------------------------------
# Gewöhnlicher while Loop welcher die werte 1-10 raus puttet
count <- 0
while(count < 10){
        print(count)
        count <- count +1
}

#-------------------------------------------------------------------------
# Einfache Function; 1 Parameter-Übergabe und Print 
f <- function(x) {
        print(x)  
}
f(90)

#-------------------------------------------------------------------------
# Function mit "default-werten", wenn keine Parameter übergeben wird
f <- function(number, zip = 10) {
        print(number / zip)  
}
f(90)

#-------------------------------------------------------------------------
# Function mit "default-werten" und qualifizierte Parameter-Übergabe "by name" also "number=90"
f <- function(number = 20, zip = 10) {
        print(number / zip)  
}
f(number=90,9)

#-------------------------------------------------------------------------
# Coding Standarts for R-Code
#-------------------------------------------------------------------------
#    1. Use Text Editor to write code
#    2. Intend your Code (Einrücken) min.4 spaces, ideal 8 spaces
#    3. line length limit for code should be max.80 chars
#    4. Split functions into logical peaces       

#-------------------------------------------------------------------------
# Dates & Times
#-------------------------------------------------------------------------
#    1. Use Text Editor to write code
#    2. Intend your Code (Einrücken) min.4 spaces, ideal 8 spaces
#    3. line length limit for code should be max.80 chars

# Time in R

x <- Sys.time()
x
# [1] "2015-03-14 18:28:09 CET"

p <- as.POSIXlt(x)

# durch "unclass" werden die elemente von POSIXlt angezeigt
names(unclass(p))
# [1] "sec"    "min"    "hour"   "mday"   "mon"    "year"   "wday"  
# [8] "yday"   "isdst"  "zone"   "gmtoff"

#  All die folgenden Werte, die ausgeprintet werden, beziehen sich auf p bzw. x, also auf den Zeipunkt
#  an welchen die Variable mit dem System datum befüllt wurde !!
p$isdt
#       aktuelle Sekunde
p$sec
#       aktuelle Minute
p$min
#       aktuelle Stunde
p$hour
#       Tag im akteullen Monat
p$mday
#       ????
p$mon
#       Tag des aktuellen Jahres
p$year
#       Nummer des aktuellen Wochentags
p$wday
#       
p$yday
#       
p$isdst
#       Zeitzone      
p$zone
#       
p$gmtoff

#-------------------------------------------------------------------------
# Datum konvertieren
datestring <- c("January 10, 2012 10:14")
x <- strptime (datestring, "%B %d, %Y %H:%M")
x


h <- function(x, y = NULL, d = 3L) {
        z <- cbind(x, d)
        if(!is.null(y))
                z <- z + y
        else
                z <- z + f
        g <- x + y / z
        if(d == 3L)
                return(g)
        g <- g + 10
        g
}
h


