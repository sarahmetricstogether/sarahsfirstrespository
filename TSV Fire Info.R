library(RODBC)    #loads the RODBC package
# download data from: https://www.fs.usda.gov/rds/archive/catalog/RDS-2013-0009.6

dta <- odbcConnectAccess2007("Data/FPA_FOD_20221014.accdb")   #specifies the file path
df1 <- sqlFetch(dta, "Fires")   #loads the table called 'fires' in the original Access file
df2 <- sqlFetch(dta, "NWCG_UnitIDActive_20200123")   #loads the table called 'xxxxx' in the original Access file

df1 <- df1[df1$STATE=="NM",]
df1 <- df1[df1$COUNTY %in% c("Taos","055","55","East Taos","West Taos"),]

df1_2 <- df1[df1$FIRE_YEAR %in% c(2020,2021,2022),]


library(sf)
library(mapview)
library(rvest)
library(httr)


# 3) Read the KML file as a Spatial object
moh_chas_clinics <- read_sf(here::here("Untitled Project.kml"))
