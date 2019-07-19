#install.packages("rvest")
#library (rvest)
#leo pagina 
pagina<- read_html("Cupones.html")
nodesDescuento<- html_nodes(pagina,".dcto")
html_text(nodesDescuento)
dcto<- html_text(nodesDescuento)
print (dcto)
nodesDescuento<- as.numeric(nodesDescuento)

dcto<-gsub("%","",dcto)

dfprecios <- as.data.frame(dcto)
print (nodesDescuento[100])

nodesvendido <- html_nodes(pagina,".extras")
html_text(nodesvendido)
vendidos<- html_text(nodesvendido)
vendidos<-gsub("\n","",vendidos)
vendidos<-gsub("Vendidos","",vendidos)
vendidos<-gsub("0H07M38S","1", vendidos)
vendidos<-gsub(" ","",vendidos)
vendidos<-gsub("Últimasunidades","0",vendidos)

print (vendidos)
dfvendido<- as.data.frame(vendidos)
library('ggplot2')
dfprecios %>%
  ggplot() +
  aes(x = dcto, y = vendidos) +
  geom_bar(stat="identity")+
  coord_flip()


nodesPrecio<- html_nodes(pagina,".actual")
html_text(nodesPrecio)
precio<- html_text(nodesPrecio)
print (precio)
precio<-gsub("\\$","",precio)
precio<-gsub("[.]","",precio)

precio<- as.numeric(precio)
dfprecio<- as.data.frame(precio)

dfprecio %>%
  ggplot() +
  aes(x = dcto, y = precio) +
  geom_bar(stat="identity")+
  coord_flip()


