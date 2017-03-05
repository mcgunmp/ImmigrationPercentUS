library(xlsx)

#upload data into R
migration_url<-"http://www.migrationpolicy.org/sites/default/files/datahub/MPI-Data-Hub_Immigrants_N-Percent-US-Population_2015.xls"
download.file(migration_url, "Migration.xls", mode = "wb" )
migration<-read.xlsx("Migration.xls", 
                     sheetName = "Number and Percent Imm - Table ", startRow = 9, endRow = 30, header = FALSE)
#check out data
head(migration)

#cleaning data, giving columns name, and removing the extra column
colnames(migration)<-c("Year","Number", "Percent")
migration<-migration[,1:3]
#getting rid of 2011-2014 data
migration<-migration[-c(18:21),]
)


library(plotly)
ay <- list(
  tickfont = list(color = "red"),
  overlaying = "y",
  side = "right",
  title = "Number of Immigrants"
)
by <- list(
  
  tickfont = list(color = "red"),
  overlaying = "n",
  side = "left",
  title = "Immigrants as Percent of Population"
)

p <- plot_ly(migration, x = ~Year, y = ~ Percent, name = 'Immigrants as Percent of Population', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~Number, name = 'Number of Immigrants', mode = 'lines', yaxis = "y2") %>% 
layout(
  title = "Number of Immigrants and Their Share of the Total U.S. Population, 1850-2015", yaxis2 = ay, yaxis = by,
  xaxis = list(title="Year")
  
  
)

p



