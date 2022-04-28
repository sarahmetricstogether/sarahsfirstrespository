# Welcome to R Sarah Barnett, you beautiful beast
# here's a little demo on tribal plots!
library(tigris)
tribalarea <- tigris::native_areas()
ourtribes <- c("Pojoaque","Ohkay Owingeh","Taos","Picuris","Nambe","Jicarilla Apache Nation","Santa Clara","San Idelfonso","Tesuque")
ourareas <- tribalarea[tribalarea$NAME %in% ourtribes,]
plot(tribalarea[,16],col="lightblue")

# for (i in 1:6) {
#   png(file= paste0(ourtribes[i],".png"),
#       width=600, height=350)
#   plot(ourareas[i,16],col="lightblue")
#   dev.off()
# }

plot(tribalarea[tribalarea$NAME=="San Ildefonso",16],col="lightblue")

plot(tribalarea[tribalarea$NAME=="Tesuque",16],col="lightblue")

ggplot() + 
  geom_sf(data = ourareas, mapping = aes(),fill="lightblue", show.legend = FALSE) +
  coord_sf()
